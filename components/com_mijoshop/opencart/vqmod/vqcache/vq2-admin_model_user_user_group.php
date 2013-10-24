<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ModelUserUserGroup extends Model {
	public function addUserGroup($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "user_group SET name = '" . $this->db->escape($data['name']) . "', permission = '" . (isset($data['permission']) ? serialize($data['permission']) : '') . "'");

        $user_group_id = $this->db->getLastId();
        $this->db->query("INSERT INTO " . DB_PREFIX . "jgroup_ugroup_map SET jgroup_id = '" . (int)$data['jgroup_id'] . "', ugroup_id = '" . (int)$user_group_id . "'");
	}
	
	public function editUserGroup($user_group_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "jgroup_ugroup_map SET jgroup_id = '" . (int)$data['jgroup_id'] . "' WHERE ugroup_id = '" . (int)$user_group_id . "'");
		$this->db->query("UPDATE " . DB_PREFIX . "user_group SET name = '" . $this->db->escape($data['name']) . "', permission = '" . (isset($data['permission']) ? serialize($data['permission']) : '') . "' WHERE user_group_id = '" . (int)$user_group_id . "'");
	}
	
	public function deleteUserGroup($user_group_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "jgroup_ugroup_map WHERE ugroup_id = '" . (int)$user_group_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_group_id . "'");
	}

	public function addPermission($user_id, $type, $page) {
		$user_query = $this->db->query("SELECT DISTINCT user_group_id FROM " . DB_PREFIX . "user WHERE user_id = '" . (int)$user_id . "'");
		
		if ($user_query->num_rows) {
			$user_group_query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");
		
			if ($user_group_query->num_rows) {
				$data = unserialize($user_group_query->row['permission']);
		
				$data[$type][] = $page;
		
				$this->db->query("UPDATE " . DB_PREFIX . "user_group SET permission = '" . serialize($data) . "' WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");
			}
		}
	}
	
	public function getUserGroup($user_group_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_group_id . "'");
		
		$user_group = array(
			'name'       => $query->row['name'],
			'permission' => unserialize($query->row['permission'])
		);
		
		return $user_group;
	}
	
	public function getUserGroups($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "user_group";
		
		$sql .= " ORDER BY name";	
			
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
			
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getTotalUserGroups() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "user_group");
		
		return $query->row['total'];
	}	
}
?>