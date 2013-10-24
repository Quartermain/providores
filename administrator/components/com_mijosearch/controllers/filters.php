<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

class MijosearchControllerFilters extends MijosearchController {
	
	function __construct() {
		if (!JFactory::getUser()->authorise('mijosearch.filters', 'com_mijosearch')) {
			//return JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
		}

		parent::__construct('filters');
	}

	function editGroup() {
		// Check token
		//JRequest::checkToken() or jexit('Invalid Token');

		JRequest::setVar('hidemainmenu', 1);

		$view = $this->getView(ucfirst($this->_context), 'gedit');
		$view->setModel($this->_model, true);
		$view->edit('gedit');
	}

	function deleteGroup() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');

        // Apply
        if ($this->_model->deleteGroup()) {
            $msg = JText::_('COM_MIJOSEARCH_COMMON_RECORDS_DELETED');
        }
        else {
            $msg = JText::_('COM_MIJOSEARCH_COMMON_RECORDS_DELETED_NOT');
        }

		// Return
		parent::route($msg);
	}

	function getExtensionFields() {
		$option = JRequest::getCmd('ext');
		if (empty($option)) {
			return;
		}

        echo $this->_model->getExtensionFields($option);
	}

	function editSave() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');

		// Get post
		$post = JRequest::get('post');

		if ($post['is_group'] == '1') {
			$table = 'MijosearchGroups';
		}
		else {
			$this->_model->getFilterParams($post);
			$table = 'MijosearchFilters';
		}

		// Save record
		if (!parent::saveRecord($post, $table , $post['id'])) {
			return JError::raiseWarning(500, JText::_('COM_MIJOSEARCH_COMMON_RECORD_SAVED_NOT'));
		} else {
			if ($post['modal'] == '1') {
				// Display message
				JFactory::getApplication()->enqueueMessage(JText::_('COM_MIJOSEARCH_COMMON_RECORD_SAVED'));
			} else {
				// Return
				parent::route(JText::_('COM_MIJOSEARCH_COMMON_RECORD_SAVED'));
			}
		}
	}
	
	function editApply() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');

		// Get post
		$post = JRequest::get('post');
		
		if ($post['is_group'] == '1') {
			$table = 'MijosearchGroups';
		}
		else {
			$this->_model->getFilterParams($post);
			$table = 'MijosearchFilters';
		}
		
		// Save record
		if (!parent::saveRecord($post, $table, $post['id'])) {
			return JError::raiseWarning(500, JText::_('COM_MIJOSEARCH_COMMON_RECORD_SAVED_NOT'));
		} else {
			if ($post['modal'] == '1') { 
				// Return
				$this->setRedirect('index.php?option=com_mijosearch&controller=filters&task=edit&cid[]='.$post['id'].'&tmpl=component', JText::_('COM_MIJOSEARCH_COMMON_RECORD_SAVED'));
			} else { 
				// Return
				$this->setRedirect('index.php?option=com_mijosearch&controller=filters&task=edit&cid[]='.$post['id'], JText::_('COM_MIJOSEARCH_COMMON_RECORD_SAVED'));
			}
		}
	}
}