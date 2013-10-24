<?php 
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');

class ControllerToolThemeEditor extends Controller { 
	private $error = array();
	private $extensions_file = array('.css', '.js', '.tpl', '.html', '.php');

	public function index() {
		$this->load->language('tool/themeeditor');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['button_clear_cache'] = $this->language->get('button_clear_cache');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_restore'] = $this->language->get('button_restore');
		$this->data['button_delete'] = $this->language->get('button_delete');

		$this->data['text_wait'] = $this->language->get('text_wait');
		$this->data['text_confirm_remove_files'] = $this->language->get('text_confirm_remove_files');
		$this->data['text_backup'] = $this->language->get('text_backup');

        $this->data['entry_backup_files'] = $this->language->get('entry_backup_files');
        $this->data['entry_last_backup_files'] = $this->language->get('entry_last_backup_files');
        $this->data['entry_available_backups'] = $this->language->get('entry_available_backups');

		$this->data['save'] = $this->url->link('tool/themeeditor', 'token=' . $this->session->data['token'], 'SSL');

		if(!is_dir($this->getPathCache())){
            mkdir($this->getPathCache());
        }

		$this->data['files'] = array();

		$files = glob($this->getPathCache() . '*.*.back', 0);

		$i = 0;

		if ($files) {
			arsort($files);

			foreach ($files as $file) {
				$filename = preg_replace('/^.*\//', '', $file);
				$date = substr($filename, 0, strpos($filename, '.'));

				$this->data['files'][] = array(
					'date' => date("d/m/Y H:i:s", $date),
					'name' => $filename,
					'size' => $this->getFilesize($file)
				);

				++$i;

				if ($i > 5)
					break;
			}
		} else {
			$files = array();
		}

		if (!is_writable($this->getPathCache())) {
			$this->data['text_folder_no_writable'] = sprintf($this->language->get('text_folder_no_writable'), $this->getPathCache());
		} else {
			$this->data['text_folder_no_writable'] = '';
		}

		$this->data['size'] = sizeof($files);
		$this->data['token'] = $this->session->data['token'];
		$this->data['connected'] = null;

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
  		$this->document->breadcrumbs = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('tool/themeeditor', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->template = 'tool/themeeditor.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render());
	}

	public function folder() {
		$root = $this->getPathTheme();
		$dir = urldecode($this->request->post['dir']);

		if (file_exists($root . $dir)) {
			$files = scandir($root . $dir);
			natcasesort($files);
	
			if (count($files) > 2) {
				echo'<ul class="jqueryFileTree" style="display: none;">';
				
				$dir_no_valid = array('image', 'images', 'img');

				foreach ($files as $file) {
					if (!in_array($file, $dir_no_valid)) {
						if (file_exists($root . $dir . $file) && $file != '.' && $file != '..' && is_dir($root . $dir . $file)) {
							echo'<li class="directory collapsed"><a href="#" rel="' . htmlentities($dir . $file) . '/">' . htmlentities($file) . '</a></li>';
						}
					}
				}

				foreach ($files as $file) {
					if (file_exists($root . $dir . $file) && $file != '.' && $file != '..' && !is_dir($root . $dir . $file)) {
						$ext = preg_replace('/^.*\./', '', $file);
						$extension_file_verif = strrchr($file, '.');

						if (in_array($extension_file_verif, $this->extensions_file)) {					
							echo'<li class="file ext_' . $ext . '"><a onClick="tpl_edit(\'' . htmlentities($dir . $file) . '\', \'' . htmlentities($file) . '\', \'' . $ext . '\');" rel="tpl_edit(\'' . htmlentities($dir . $file) . '\', \'' . htmlentities($file) . '\', \'' . $ext . '\');">' . htmlentities($file) . '</a></li>';
						}
					}
				}

				echo'</ul>';	
			}
		}
	}

	public function edit() {
		$this->load->language('tool/themeeditor');

		$this->data['text_edit'] = $this->language->get('text_edit');

		$this->data['entry_available_backups'] = $this->language->get('entry_available_backups');

		$this->data['button_restore'] = $this->language->get('button_restore');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_delete'] = $this->language->get('button_delete');

		$this->data['action'] = $this->url->link('tool/themeeditor', 'token=' . $this->session->data['token'], 'SSL');

		$root = $this->getPathTheme();
		$path_file = $root . trim($this->request->post['path_file']);

		$this->data['restore'] = array();

		$files = glob($this->getPathCache() . '*.' . str_replace('/', '_', ltrim($this->request->post['path_file'], '/')) . '.back', 0);

		if ($files) {
			foreach ($files as $file) {
				$filename = preg_replace('/^.*\//', '', $file);
				$date = substr($filename, 0, strpos($filename, '.'));

				$this->data['restore'][] = array(
					'id'   => $date,
					'name' => date("d/m/Y H:i:s", $date),
					'size' => $this->getFilesize($file)
				);
			}
		}

		$content = trim(file_get_contents($path_file));

		$this->data['text_file_empty'] = '';

		if (empty($content)) {
			$this->data['text_file_empty'] = $this->language->get('text_file_empty');
		}

		$this->data['content'] = htmlentities($content);
		$ext = preg_replace('/^.*\./', '', $this->request->post['path_file']);
		$this->data['ext'] = $ext;
		$this->data['path_file'] =  $path_file;
		$this->data['filename'] = $this->request->post['file'];
		$this->data['edit_file'] = ltrim($this->request->post['path_file'], '/');
		$tmp = (explode('/', ltrim($this->request->post['path_file'], '/')));
        $this->data['curr_theme'] = $tmp[0];

        $this->data['themes'] = JFolder::folders(self::getPathTheme());

		$this->template = 'tool/themeeditoredit.tpl';

		$this->response->setOutput($this->render());
	}

	public function save() {
		$this->load->language('tool/themeeditor');

		$path_file = $this->request->post['path_file'];

		$json = array();

		if (!is_writable($this->getPathCache())) {
			$json['error'] = sprintf($this->language->get('text_folder_no_writable'), $this->getPathCache());
		}

		if (!isset($path_file) or !isset($this->request->post['templates'])) {
			$json['error'] = $this->language->get('error_not_saved');
		}

		if (!file_exists($path_file)) {
			$json['error'] = $this->language->get('error_file_not_exists');
		}

		if (($this->request->server['REQUEST_METHOD'] != 'POST') || !$this->validate()) {
			$json['error'] = $this->error['warning'];
		}

		$unlink = false;

		if (!isset($json['error'])) {
			if (isset($this->request->post['templates'])) {
				$copy_file = $path_file;
				$new_name = $this->getPathCache() . time() . '.' . str_replace('/', '_', $this->request->post['edit_file']) . '.back';

				if (is_writable($path_file)) {
                    JFile::copy($copy_file, $new_name);
					$unlink = true;

                    $templates = $this->request->post['templates'];
                    $html_templates = htmlspecialchars_decode($templates);
                    $utf8_template = utf8_encode($html_templates);

					if (JFile::write($path_file,$utf8_template )) {
						$json['success'] = $this->language->get('text_success');
						$unlink = false;
					} else {
						$json['error'] = $this->language->get('error_not_saved');
					}
				} else {
					$json['error'] = $this->language->get('error_not_saved');
					
				}

				if (isset($json['success'])) {
					clearstatcache();
				}

				if ($unlink) {
					@unlink($new_name);
				}
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function restore() {
		$this->load->language('tool/themeeditor');

		if (!$this->validate()) {
			echo $this->error['warning'];
			exit();
		}

		$valid_dir = stristr(realpath($this->request->post['path_file']), realpath(DIR_CATALOG . 'view/theme/'));

		$old_file = $this->getPathCache() . $this->request->post['id'] . '.' . str_replace('/', '_', $this->request->post['edit_file']) . '.back';
		$new_file = $this->request->post['path_file'];

        $extension_verif = strrchr($new_file, '.');

		if ($valid_dir && in_array($extension_verif, $this->extensions_file) && file_exists($old_file) && file_exists($new_file)) {
			if ((!is_writable($this->request->post['path_file']))) {
			    echo $this->language->get('error_failed_restore_chmod');
			}

			if (JFile::copy($old_file, $new_file)) {
				@unlink($old_file);
				clearstatcache();

				echo $this->language->get('text_success_restored');
				exit();
			}
		}

		echo $this->language->get('error_not_restored');
		exit();
	}

	public function delete() {
		$this->load->language('tool/themeeditor');

		$json = array();

		if (($this->request->server['REQUEST_METHOD'] != 'POST') || !$this->validate()) {
			$json['error'] = $this->error['warning'];
		}

		if (!isset($json['error'])) {
			$files = glob($this->getPathCache() . $this->request->post['file_id'] . '.*.back', 0);

			if ($files) {
				foreach ($files as $file) {
					if (file_exists($file)) {
						@unlink($file);
						clearstatcache();
					}
				}

				$json['success'] = $this->language->get('text_success_delete_cache');
			} else
				$json['error'] = $this->language->get('error_not_found_file_cache');
		}

		$this->response->setOutput(json_encode($json));
	}

	public function getBackupFiles() {
		$json = array();

		$files = glob($this->getPathCache() . '*.' . str_replace('/', '_', ltrim($this->request->post['file'], '/')) . '.back', 0);

		if ($files) {
			foreach ($files as $file) {
				$filename = preg_replace('/^.*\//', '', $file);
				$date = substr($filename, 0, strpos($filename, '.'));

				$json['files'][] = array(
					'id'   => $date,
					'name' => date("d/m/Y H:i:s", $date),
					'size' => $this->getFilesize($file)
				);
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function clearCache() {
		$this->load->language('tool/themeeditor');

		$json = array();

		$files = glob($this->getPathCache() . '*.back', 0);

		if ($files) {
			foreach ($files as $file) {
				if (file_exists($file)) {
					@unlink($file);
					clearstatcache();
				}
			}

			$json['success'] = $this->language->get('text_success_delete_cache');
		} else
			$json['error'] = $this->language->get('error_not_found_file_cache');

		$this->response->setOutput(json_encode($json));
	}

    public function folderCreate(){
        $foldername = $this->request->post['name'];

        if (!empty($foldername)){
            JFolder::create(self::getPathTheme().'/'.$foldername.'/template/common');
            JFolder::create(self::getPathTheme().'/'.$foldername);
            JFolder::copy(self::getPathTheme().'/default/image',self::getPathTheme().'/'.$foldername.'/'.'image');
            JFolder::copy(self::getPathTheme().'/default/stylesheet',self::getPathTheme().'/'.$foldername.'/stylesheet');
            JFile::copy(self::getPathTheme().'/default/template/common/header.tpl', self::getPathTheme().'/'.$foldername.'/template/common/header.tpl');
            $common_tpl = JFile::read(self::getPathTheme().'/'.$foldername.'/template/common/header.tpl');
            $common_tpl = str_replace('/default/', '/'.$foldername.'/', $common_tpl );
            JFile::write(self::getPathTheme().'/'.$foldername.'/template/common/header.tpl', $common_tpl);
        }
    }

    public function cloneFile(){
        $file_path = $new_file = $this->request->post['path'];
        $curr_path = $new_file = $this->request->post['curr_path'];
        $file = $new_file = $this->request->post['file'];

        if (file_exists(self::getPathTheme().'/'.$curr_path)){
            $path = str_replace($file , '', $file_path);

            if(!is_dir (self::getPathTheme().'/'.$path)){
                JFolder::create(self::getPathTheme().'/'.$path);
            }

            JFile::copy(self::getPathTheme().'/'.$curr_path, self::getPathTheme().'/'.$file_path);
        }
    }

	private function getPathTheme() {
		return str_replace("\\", "/", DIR_CATALOG . 'view/theme');
	}

	private function getPathCache() {
		return str_replace("\\", "/", DIR_CACHE . 'editor/');
	}

	private function getFilesize($file) {
		$size = ($file && @is_file($file)) ? filesize($file) : null;
		$FS = array("B","kB","MB","GB","TB","PB","EB","ZB","YB");

		return number_format($size/pow(1024, $i = floor(log($size, 1024))), ($i > 1) ? 2 : 0) . ' ' . $FS[$i];
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'tool/themeeditor')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {			
			return FALSE;
		}		
	}
}
?>