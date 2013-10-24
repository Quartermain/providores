<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');
require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

class MijoShopInstall {

	public function createTables() {
		$db = MijoShop::get('db')->getDbo();

		$tables	= $db->getTableList();
		$mijoshop_address = $db->getPrefix().'mijoshop_address';
		if (!is_array($tables) || in_array($mijoshop_address, $tables)) {
			return;
		}

		$this->_runSqlFile(JPATH_MIJOSHOP_ADMIN.'/install.sql');
	}

	public function createUserTables() {
        $db = MijoShop::get('db');
        $jdb = MijoShop::get('db')->getDbo();

        $this->_createUserMapTables();

        $tables	= $jdb->getTableList();
		$mijoshop_user = $jdb->getPrefix().'mijoshop_user';
		if (!is_array($tables) || in_array($mijoshop_user, $tables)) {
			return;
		}

        $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_user` (
		  `user_id` int(11) NOT NULL AUTO_INCREMENT,
		  `user_group_id` int(11) NOT NULL,
		  `username` varchar(20) COLLATE utf8_general_ci NOT NULL DEFAULT '',
		  `password` varchar(40) COLLATE utf8_general_ci NOT NULL DEFAULT '',
		  `salt` varchar(9) COLLATE utf8_general_ci NOT NULL DEFAULT '',
		  `firstname` varchar(32) COLLATE utf8_general_ci NOT NULL DEFAULT '',
		  `lastname` varchar(32) COLLATE utf8_general_ci NOT NULL DEFAULT '',
		  `email` varchar(96) COLLATE utf8_general_ci NOT NULL DEFAULT '',
		  `code` varchar(32) COLLATE utf8_general_ci NOT NULL,
		  `ip` varchar(40) COLLATE utf8_general_ci NOT NULL DEFAULT '',
		  `status` tinyint(1) NOT NULL,
		  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
		  PRIMARY KEY (`user_id`)
		) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
        $jdb->query();

        $users = MijoShop::get('db')->run('SELECT u.* FROM #__users AS u, #__user_usergroup_map AS uum WHERE uum.group_id IN (7, 8) AND u.id = uum.user_id AND u.block = 0', 'loadObjectList');

		if (empty($users)) {
			return;
		}

		foreach ($users as $user) {
			$name = explode(' ', $user->name);

			$firstname = $name[0];
			$lastname = MijoShop::get('user')->getLastName($name);

			$password = $user->password;
			if (strpos($password, ':')) {
				$a = explode(':', $password);
				$password = $a[0];
			}

            $db->run("INSERT IGNORE INTO #__mijoshop_user SET ".
							"username = '" . $user->username . "', ".
							"password = '" . $password . "', ".
							"firstname = '" . $firstname . "', ".
							"lastname = '" . $lastname . "', ".
							"email = '" . $user->email . "', ".
							"user_group_id = '1', ".
							"status = '1', ".
							"date_added = NOW()"
						, 'query'
						);
		}
	}

    public function _createUserMapTables() {
        $db = MijoShop::get('db');
        $jdb = MijoShop::get('db')->getDbo();

        $tables	= $jdb->getTableList();
        $mijoshop_juser_ocustomer_map = $jdb->getPrefix().'mijoshop_juser_ocustomer_map';
        if (!is_array($tables) || in_array($mijoshop_juser_ocustomer_map, $tables)) {
            return;
        }

        $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_juser_ocustomer_map` (
          `juser_id` INT(11) NOT NULL,
          `ocustomer_id` INT(11) NOT NULL,
          PRIMARY KEY (`juser_id`),
          UNIQUE (`ocustomer_id`)
        ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
        $jdb->query();

        $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_juser_ouser_map` (
          `juser_id` INT(11) NOT NULL,
          `ouser_id` INT(11) NOT NULL,
          PRIMARY KEY (`juser_id`),
          UNIQUE (`ouser_id`)
        ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
        $jdb->query();
    }

	public function createGroupTables() {
        $db = MijoShop::get('db');
        $jdb = MijoShop::get('db')->getDbo();

		$tables	= $jdb->getTableList();
		$mijoshop_jgroup_cgroup_map = $jdb->getPrefix().'mijoshop_jgroup_cgroup_map';
		if (!is_array($tables) || in_array($mijoshop_jgroup_cgroup_map, $tables)) {
			return;
		}

        $registered = 2;
        $publisher = 5;
        $administrator = 8;

        $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_jgroup_cgroup_map` (
		  `jgroup_id` INT(11) NOT NULL,
		  `cgroup_id` INT(11) NOT NULL,
		  PRIMARY KEY (`cgroup_id`)
		) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
        $jdb->query();

		$customer_groups = $db->run('SELECT customer_group_id FROM #__mijoshop_customer_group', 'loadColumn');
		if (!empty($customer_groups)) {
            foreach ($customer_groups as $customer_group) {
                $j_group = $registered;
                if ($customer_group == 6) {
                    $j_group = $publisher;
                }

                $db->run("INSERT INTO #__mijoshop_jgroup_cgroup_map SET jgroup_id = '{$j_group}', cgroup_id = '{$customer_group}'", 'query');
            }
        }

        $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_jgroup_ugroup_map` (
      		  `jgroup_id` INT(11) NOT NULL,
      		  `ugroup_id` INT(11) NOT NULL,
      		  PRIMARY KEY (`ugroup_id`)
      		) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
        $jdb->query();

        $user_groups = $db->run('SELECT user_group_id FROM #__mijoshop_user_group', 'loadColumn');
		if (!empty($user_groups)) {
            foreach ($user_groups as $user_group) {
                $db->run("INSERT INTO #__mijoshop_jgroup_ugroup_map SET jgroup_id = '{$administrator}', ugroup_id = '{$user_group}'", 'query');
            }
        }
	}

    public function createIntegrationTables() {
        $db = MijoShop::get('db');
        $jdb = MijoShop::get('db')->getDbo();

        $tables	= $jdb->getTableList();
        $mijoshop_j_integrations = $jdb->getPrefix().'mijoshop_j_integrations';
        if (!is_array($tables) || in_array($mijoshop_j_integrations, $tables)) {
            return;
        }

        $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_j_integrations` (
			`product_id` INT NOT NULL,
			`content` TEXT NOT NULL
			) CHARSET=utf8 COLLATE=utf8_general_ci;");
        $jdb->query();
    }
	
	public function install150(){
        $jdb = MijoShop::get('db')->getDbo();
		
		//Mijoshop component params to Mijoshop settings
		$jdb->setQuery("SELECT `params` FROM `#__extensions` WHERE `type` = 'component' AND `element` = 'com_mijoshop'");
		$params = $jdb->loadResult();
		
		if (!empty($params) and ($params != '{}')) {
			$config_mijoshop = serialize(json_decode($params, true));
		}
		else {
			$button_class = 's:9:"button_oc';
			if(MijoShop::getClass('base')->is30()){
				$button_class = 's:15:"btn btn-primary';
			}
		
			$config_mijoshop = 'a:12:{s:3:"pid";s:0:"";s:18:"enable_vqmod_cache";s:1:"1";s:11:"show_header";s:1:"1";s:11:"show_footer";s:1:"1";s:14:"show_cats_menu";s:1:"0";s:19:"trigger_content_plg";s:1:"0";s:12:"fix_ie_cache";s:1:"0";s:16:"mijoshop_display";s:1:"0";s:12:"button_class";'.$button_class.'";s:8:"comments";s:1:"0";s:19:"mijosef_integration";s:1:"0";s:17:"account_sync_done";s:1:"0";}';
		}
		
		$value = "(0, 'config', 'config_mijoshop', '{$config_mijoshop}', 1)";
        $jdb->setQuery("INSERT INTO `#__mijoshop_setting` (`store_id`, `group`, `key`, `value`, `serialized`) VALUES". $value);
        $jdb->query();
	}

    public function _runSqlFile($sql_file) {
        if (!file_exists($sql_file)) {
            return;
        }

        $buffer = file_get_contents($sql_file);

        if ($buffer === false) {
            return;
        }

        jimport('joomla.installer.helper');

        $queries = JInstallerHelper::splitSql($buffer);

        if (count($queries) == 0) {
            return;
        }

        $db = MijoShop::get('db')->getDbo();

        foreach ($queries as $query) {
            $query = trim($query);

            if ($query != '' && $query{0} != '#') {
                $db->setQuery($query);

                if (!$db->query()) {
                    JError::raiseWarning(1, 'JInstaller::install: '.JText::_('SQL Error')." ".$db->stderr(true));
                    return;
                }
            }
        }
    }

    public function upgradeDbToV155() {
        $db     = MijoShop::get('db');
        $jdb    = MijoShop::get('db')->getDbo();
        $tables	= $jdb->getTableList();

        $mijoshop_category_path = $jdb->getPrefix().'mijoshop_category_path';
        if (is_array($tables) and !in_array($mijoshop_category_path, $tables)) {
            $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_category_path` (
                `category_id` int(11) NOT NULL,
                `path_id` int(11) NOT NULL,
                `level` int(11) NOT NULL,
                PRIMARY KEY (`category_id`,`path_id`)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
            $jdb->query();

        }
		
		//set category pets
		$jdb->setQuery("SELECT category_id, parent_id FROM `#__mijoshop_category`");
		$categories = $jdb->loadObjectList();

		if (!empty($categories)){
			foreach($categories as $category){
				$path = self::_getPath($category->category_id, array($category->category_id));
				$path = array_reverse($path);
				
				foreach($path as $key => $_path){
					$jdb->setQuery("INSERT INTO `#__mijoshop_category_path` (`category_id`, `path_id`, `level`) VALUES('{$category->category_id}','{$_path}','{$key}')");
					$jdb->query();
				}
			}
		}
		
        $mijoshop_filter = $jdb->getPrefix().'mijoshop_filter';
        if (is_array($tables) and !in_array($mijoshop_filter, $tables)) {
            $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_filter` (
                `filter_id` int(11) NOT NULL AUTO_INCREMENT,
                `filter_group_id` int(11) NOT NULL,
                `sort_order` int(3) NOT NULL,
                PRIMARY KEY (`filter_id`)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
            $jdb->query();
        }

        $mijoshop_filter_description = $jdb->getPrefix().'mijoshop_filter_description';
        if (is_array($tables) and !in_array($mijoshop_filter_description, $tables)) {
            $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_filter_description` (
                `filter_id` int(11) NOT NULL,
                `language_id` int(11) NOT NULL,
                `filter_group_id` int(11) NOT NULL,
                `name` varchar(64) NOT NULL,
                PRIMARY KEY (`filter_id`,`language_id`)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
            $jdb->query();
        }

        $mijoshop_filter_group = $jdb->getPrefix().'mijoshop_filter_group';
        if (is_array($tables) and !in_array($mijoshop_filter_group, $tables)) {
            $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_filter_group` (
                `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
                `sort_order` int(3) NOT NULL,
                PRIMARY KEY (`filter_group_id`)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
            $jdb->query();
        }

        $mijoshop_filter_group_description = $jdb->getPrefix().'mijoshop_filter_group_description';
        if (is_array($tables) and !in_array($mijoshop_filter_group_description, $tables)) {
            $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_filter_group_description` (
                `filter_group_id` int(11) NOT NULL,
                `language_id` int(11) NOT NULL,
                `name` varchar(64) NOT NULL,
                PRIMARY KEY (`filter_group_id`,`language_id`)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
            $jdb->query();
        }

        $mijoshop_category_filter = $jdb->getPrefix().'mijoshop_category_filter';
        if (is_array($tables) and !in_array($mijoshop_category_filter, $tables)) {
            $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_category_filter` (
				`category_id` int(11) NOT NULL,
				`filter_id` int(11) NOT NULL,
				PRIMARY KEY (`category_id`,`filter_id`)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
            $jdb->query();
        }

        $mijoshop_product_filter = $jdb->getPrefix().'mijoshop_product_filter';
        if (is_array($tables) and !in_array($mijoshop_product_filter, $tables)) {
            $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_product_filter` (
                `product_id` int(11) NOT NULL,
                `filter_id` int(11) NOT NULL,
                PRIMARY KEY (`product_id`,`filter_id`)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
            $jdb->query();
        }
		
		$mijoshop_coupon_category = $jdb->getPrefix().'mijoshop_coupon_category';
        if (is_array($tables) and !in_array($mijoshop_coupon_category, $tables)) {
            $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_coupon_category` (
				`coupon_id` int(11) NOT NULL,
				`category_id` int(11) NOT NULL,
				PRIMARY KEY (`coupon_id`,`category_id`)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
            $jdb->query();
        }
		
		$mijoshop_customer_history = $jdb->getPrefix().'mijoshop_customer_history';
        if (is_array($tables) and !in_array($mijoshop_customer_history, $tables)) {
            $jdb->setQuery("CREATE TABLE IF NOT EXISTS `#__mijoshop_customer_history` (
				`customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
				`customer_id` int(11) NOT NULL,
				`comment` text NOT NULL,
				`date_added` datetime NOT NULL,
				PRIMARY KEY (`customer_history_id`)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");
            $jdb->query();
        }
		
		$mijoshop_customer_ip_blacklist = $jdb->getPrefix().'mijoshop_customer_ip_blacklist';
        if (is_array($tables) and in_array($mijoshop_customer_ip_blacklist, $tables)) {
            $jdb->setQuery("RENAME TABLE  `#__mijoshop_customer_ip_blacklist` TO  `#__mijoshop_customer_ban_ip`");
            $jdb->query();
			$jdb->setQuery("ALTER TABLE  `#__mijoshop_customer_ban_ip` CHANGE  `customer_ip_blacklist_id`  `customer_ban_ip_id` INT( 11 ) NOT NULL AUTO_INCREMENT");
            $jdb->query();
        }
		
		//insert permission for new modules or vs
        $jdb->setQuery("SELECT permission FROM  `#__mijoshop_user_group` WHERE user_group_id = 1");
        $permission = $jdb->loadResult();
        $permission = unserialize($permission);

        if (!array_search('common/editorbutton', $permission['access']) ){
            $permission['access'][] = 'common/editorbutton';
            $permission['modify'][] = 'common/editorbutton';
        }

        if (!array_search('module/mijoshopcurrency', $permission['access']) ){
            $permission['access'][] = 'module/mijoshopcurrency';
            $permission['modify'][] = 'module/mijoshopcurrency';
        }

        if (!array_search('module/mijoshopminicart', $permission['access']) ){
            $permission['access'][] = 'module/mijoshopminicart';
            $permission['modify'][] = 'module/mijoshopminicart';
        }

        if (!array_search('catalog/filter', $permission['access']) ){
            $permission['access'][] = 'catalog/filter';
            $permission['modify'][] = 'catalog/filter';
        }

        if (!array_search('module/filter', $permission['access']) ){
            $permission['access'][] = 'module/filter';
            $permission['modify'][] = 'module/filter';
        }

        if (!array_search('sale/customer_ban_ip', $permission['access']) ){
            $permission['access'][] = 'sale/customer_ban_ip';
            $permission['modify'][] = 'sale/customer_ban_ip';
        }

        $permission = serialize($permission);

        $jdb->setQuery("UPDATE `#__mijoshop_user_group` SET permission = '".$permission."' WHERE user_group_id = 1");
        $jdb->query();
		
		//insert new settings parameter and changes (`store_id`, `group`, `key`, `value`, `serialized`) VALUES
        $jdb->setQuery("SELECT `value` FROM  `#__mijoshop_setting` WHERE `key` = 'config_use_ssl'");
        $secure = $jdb->loadResult();
        $jdb->setQuery("SELECT `value` FROM  `#__mijoshop_setting` WHERE `key` = 'config_upload_allowed'");
        $filetypes = $jdb->loadResult();
        $filetypes = str_replace(' ', '', $filetypes);
        $filetypes = explode(',', $filetypes);
        $_filetypes = "";
        foreach($filetypes as $filetype){
            $_filetypes .= $filetype;
            if (next($filetypes) == true) $_filetypes .= '\r\n';
        }
		
		$jdb->setQuery("SELECT `key` FROM  `#__mijoshop_setting`");
		$keys = $jdb->loadColumn();
		$values = array();
		
		if (!array_search('config_robots', $keys)){
            $config_robots = 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshaihulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwget\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg';            
            $values[] ="(0, 'config', 'config_robots', '{$config_robots}', 0)";
        }

		if (!array_search('config_password', $keys)){
			$values[] = "(0, 'config', 'config_password', '1', 0)";
        }

		if (!array_search('config_product_count', $keys)){
			$values[] = "(0, 'config', 'config_product_count', '1', 0)";
        }

		if (!array_search('config_secure', $keys)){
			$values[] = "(0, 'config', 'config_secure', '{$secure}', 0)";
        }
		
		if (!array_search('config_file_mime_allowed', $keys)){
            $config_file_mime_allowed = 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet';
			$values[] = "(0, 'config', 'config_file_mime_allowed', '{$config_file_mime_allowed}', 0)";
        }
		
		if (!array_search('config_file_extension_allowed', $keys)){
			$values[] = "(0, 'config', 'config_file_extension_allowed', '{$_filetypes}', 0)";
        }
		
		if (count($values) > 0){
			$values = implode(',', $values);
			$jdb->setQuery("INSERT INTO `#__mijoshop_setting` (`store_id`, `group`, `key`, `value`, `serialized`) VALUES".$values);
			$jdb->query();
		}
    }
	
	public function upgrade144(){
        $jdb = MijoShop::get('db')->getDbo();
		
		$jdb->setQuery("SELECT `key` FROM `#__mijoshop_setting`");
		$keys = $jdb->loadColumn();

		$config_file_mime_allowed = 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet\r\napplication/octet-stream';
		$value = "(0, 'config', 'config_file_mime_allowed', '{$config_file_mime_allowed}', 0)";

		if( !array_search('config_file_mime_allowed', $keys) ){
			$jdb->setQuery("INSERT INTO `#__mijoshop_setting` (`store_id`, `group`, `key`, `value`, `serialized`) VALUES". $value);
			$jdb->query();
		}
		else{
			$jdb->setQuery("UPDATE `#__mijoshop_setting` SET value = '". $config_file_mime_allowed . "' WHERE `key` = 'config_file_mime_allowed'");
			$jdb->query();
		}		
	}
	
	public function upgrade150(){
        $jdb = MijoShop::get('db')->getDbo();
		
		//Mijoshop component params to Mijoshop settings
		$jdb->setQuery("SELECT `params` FROM `#__extensions` WHERE `type` = 'component' AND `element` = 'com_mijoshop'");
		$params = $jdb->loadResult();
		
		if (!empty($params) and ($params != '{}')) {
			$config_mijoshop = serialize(json_decode($params, true));
		}
		else {
			$button_class = 's:9:"button_oc';
			if(MijoShop::getClass('base')->is30()){
				$button_class = 's:15:"btn btn-primary';
			}
		
			$config_mijoshop = 'a:12:{s:3:"pid";s:0:"";s:18:"enable_vqmod_cache";s:1:"1";s:11:"show_header";s:1:"1";s:11:"show_footer";s:1:"1";s:14:"show_cats_menu";s:1:"0";s:19:"trigger_content_plg";s:1:"0";s:12:"fix_ie_cache";s:1:"0";s:16:"mijoshop_display";s:1:"0";s:12:"button_class";'.$button_class.'";s:8:"comments";s:1:"0";s:19:"mijosef_integration";s:1:"0";s:17:"account_sync_done";s:1:"0";}';		
		}
		
		$value = "(0, 'config', 'config_mijoshop', '{$config_mijoshop}', 1)";
        $jdb->setQuery("INSERT INTO `#__mijoshop_setting` (`store_id`, `group`, `key`, `value`, `serialized`) VALUES". $value);
        $jdb->query();
		
		//insert permission for new modules or vs
        $jdb->setQuery("SELECT permission FROM `#__mijoshop_user_group` WHERE `user_group_id` = 1");
        $permission = $jdb->loadResult();
        $permission = unserialize($permission);

        if (!array_search('tool/themeeditor', $permission['access'])){
            $permission['access'][] = 'tool/themeeditor';
            $permission['modify'][] = 'tool/themeeditor';
        }

        $permission = serialize($permission);

        $jdb->setQuery("UPDATE `#__mijoshop_user_group` SET `permission` = '".$permission."' WHERE `user_group_id` = 1");
        $jdb->query();		
	}
	
	public function upgrade202(){
        $jdb = MijoShop::get('db')->getDbo();
		
		//insert permission for common/edit
        $jdb->setQuery("SELECT permission FROM `#__mijoshop_user_group` WHERE `user_group_id` = 1");
        $permission = $jdb->loadResult();
        $permission = unserialize($permission);

        if (!array_search('common/edit', $permission['access'])){
            $permission['access'][] = 'common/edit';
            $permission['modify'][] = 'common/edit';
        }

        $permission = serialize($permission);

        $jdb->setQuery("UPDATE `#__mijoshop_user_group` SET `permission` = '".$permission."' WHERE `user_group_id` = 1");
        $jdb->query();		
	}
	
	public function upgrade210(){
        $jdb = MijoShop::get('db')->getDbo();
		
		//insert permission for support/support
        $jdb->setQuery("SELECT permission FROM `#__mijoshop_user_group` WHERE `user_group_id` = 1");
        $permission = $jdb->loadResult();
        $permission = unserialize($permission);
		
		if (!array_search('common/upgrade', $permission['access'])){
            $permission['access'][] = 'common/upgrade';
            $permission['modify'][] = 'common/upgrade';
        }
		
        if (!array_search('common/support', $permission['access'])){
            $permission['access'][] = 'common/support';
            $permission['modify'][] = 'common/support';
        }
		
		if (!array_search('payment/pp_express', $permission['access'])){
            $permission['access'][] = 'payment/pp_express';
            $permission['modify'][] = 'payment/pp_express';
        }
		
        if (!array_search('payment/pp_payflow_iframe', $permission['access'])){
            $permission['access'][] = 'payment/pp_payflow_iframe';
            $permission['modify'][] = 'payment/pp_payflow_iframe';
        }
		
		if (!array_search('payment/pp_pro_iframe', $permission['access'])){
            $permission['access'][] = 'payment/pp_pro_iframe';
            $permission['modify'][] = 'payment/pp_pro_iframe';
        }
		
        if (!array_search('payment/pp_pro_pf', $permission['access'])){
            $permission['access'][] = 'payment/pp_pro_pf';
            $permission['modify'][] = 'payment/pp_pro_pf';
        }

        $permission = serialize($permission);

        $jdb->setQuery("UPDATE `#__mijoshop_user_group` SET `permission` = '".$permission."' WHERE `user_group_id` = 1");
        $jdb->query();
		
		//add extra zip mime type
		$new_types = array('application/x-zip', 'application/zip-compressed', 'application/x-zip-compressed', 'application/octet-stream','application/x-rar-compressed');
		$jdb->setQuery("SELECT `value` FROM `#__mijoshop_setting` WHERE `key`='config_file_mime_allowed'");
		$value = $jdb->loadResult();
		
		if(!empty($value)) {
			$array_value = explode('\r\n', $value);
			
			foreach($new_types as $type){
				if(in_array($type, $array_value) == false){
					$array_value[] = $type;
				}
			}

			$config_file_mime_allowed = implode('\r\n', $array_value);
			$jdb->setQuery("UPDATE `#__mijoshop_setting` SET value = '". $config_file_mime_allowed . "' WHERE `key` = 'config_file_mime_allowed'");
			$jdb->query();
		}
		else{
			$config_file_mime_allowed = 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-zip\r\napplication/zip-compressed\r\napplication/x-zip-compressed\r\napplication/x-compress\r\napplication/octet-stream\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet';
			$value = "(0, 'config', 'config_file_mime_allowed', '{$config_file_mime_allowed}', 0)";
			$jdb->setQuery("INSERT INTO `#__mijoshop_setting` (`store_id`, `group`, `key`, `value`, `serialized`) VALUES". $value);
			$jdb->query();
		}

		// Delete subcat images extension
		$subcat_images 				= JPATH_MIJOSHOP_OC . '/vqmod/xml/subcat_images.xml';
		$subcat_images_ 			= JPATH_MIJOSHOP_OC . '/vqmod/xml/subcat_images.xml_';
		$mijoshop_subcat_images 	= JPATH_MIJOSHOP_OC . '/vqmod/xml/mijoshop_subcat_images.xml';
		$mijoshop_subcat_images_ 	= JPATH_MIJOSHOP_OC . '/vqmod/xml/mijoshop_subcat_images.xml_';
		$mijoshop_lang_controller 	= JPATH_MIJOSHOP_OC . '/admin/controller/localisation/language.php';
		
		if (JFile::exists($subcat_images)) {
            JFile::delete($subcat_images);
        }
		
		if (JFile::exists($subcat_images_)) {
            JFile::delete($subcat_images_);
        }
		
		if (JFile::exists($mijoshop_subcat_images)) {
            JFile::delete($mijoshop_subcat_images);
        }
		
		if (JFile::exists($mijoshop_subcat_images_)) {
            JFile::delete($mijoshop_subcat_images_);
        }
		
		if (JFile::exists($mijoshop_lang_controller)) {
            JFile::delete($mijoshop_lang_controller);
        }
    }
	
	public function upgrade213(){
		//MijoShop::get('utility')->checkLanguage();
		self::checkLanguage();
	}
	
    public function checkLanguage(){
        $db = MijoShop::get('db');

        $oc_langs   = self::getOcLanguages();
        $j_langs    = self::getInstalledJoomlaLanguages();
        $j_contents = self::getLanguageList();

        foreach ($oc_langs as $key => $oc_lang) {
            if(isset($j_langs[$key]) and !isset($j_contents[$key])) {
                $db->run("INSERT INTO #__languages SET lang_code = '".$j_langs[$key]['tag']."', title = '".$j_langs[$key]['name']."', title_native = '".$j_langs[$key]['name']."', sef ='".$j_langs[$key]['code']."', image ='".$j_langs[$key]['code']."', published = 1, access = 1, ordering = 0", 'query');
            }
        }
    }
	
	public function getOcLanguages() {
        $language_data = array();

        $results = MijoShop::get('db')->run("SELECT * FROM #__mijoshop_language WHERE status = 1 ORDER BY sort_order, name", 'loadAssocList');

        foreach ($results as $result) {
            $language_data[$result['code']] = array(
                'language_id' => $result['language_id'],
                'name'        => $result['name'],
                'code'        => $result['code'],
                'locale'      => $result['locale'],
                'image'       => $result['image'],
                'directory'   => $result['directory'],
                'filename'    => $result['filename'],
                'sort_order'  => $result['sort_order'],
                'status'      => $result['status']
            );
        }

        return $language_data;
    }

    public function getInstalledJoomlaLanguages($client = 0) {

        $langlist = array();

        $results = MijoShop::get('db')->run("SELECT name, element FROM #__extensions WHERE type = 'language' AND state = 0 AND enabled = 1 AND client_id= ". (int) $client, 'loadAssocList');

        foreach ($results as $result) {
            $_result = explode('-', $result['element']);

            if($result['element'] == 'pt-BR'){
                $_result[0] = strtolower($result['element']);
            }

            $langlist[$_result[0]] = array(
                'code' => $_result[0],
                'tag'  => $result['element'],
                'name'  => $result['name']
            );
        }

        return $langlist;
    }
	
	public function getLanguageList() {

		$language_data = array();

		$results = MijoShop::get('db')->run("SELECT * FROM #__languages ORDER BY ordering, title", 'loadAssocList');

		foreach ($results as $result) {
			$language_data[$result['sef']] = array(
				'language_id' => $result['lang_id'],
				'name'        => $result['title_native'],
				'code'        => $result['sef'],
				'locale'      => $result['lang_code'],
				'image'       => $result['image'].'.gif',
				'directory'   => 'english',
				'filename'    => 'english',
				'sort_order'  => $result['ordering'],
				'status'      => $result['published']
			);
		}
        

        return $language_data;
    }
	
    private function _getPath($cat_id, $path = array()){
        $jdb = MijoShop::get('db')->getDbo();
		
        $jdb->setQuery("SELECT parent_id FROM `#__mijoshop_category` WHERE category_id = ".$cat_id);
        $parent_id = $jdb->loadResult();

        if ((int)$parent_id != 0) {
            $path[] = $parent_id;
            $path = self::_getPath($parent_id, $path);
        }

        return $path;
    }
}