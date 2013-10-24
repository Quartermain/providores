<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

// No Permission
defined('_JEXEC') or die('Restricted access');

class MijosearchSuggestions {
	
	function __construct() {
		// Get config object
		$this->MijosearchConfig = MijoSearch::getConfig();
	}
	
	public function getSuggestions($input) {
		$html = "";

		if (empty($input)) {
			return $html;
		}
		
		$this->input = $input;
		$this->lang = JFactory::getLanguage()->getTag();

        $function = $this->MijosearchConfig->suggestions_engine;

		$suggestions = self::$function();

		if (empty($suggestions)) {
			return $html;
		}

		$html .= '<div class="mijosearch_suggestions">';
        $html .= JText::_('COM_MIJOSEARCH_SEARCH_DID_YOU_MEAN').' ';
		
		if (JFactory::getApplication()->isAdmin()) {
			$link = 'index.php?option=com_mijosearch&controller=search&task=view&query=';
		}
		else {
			$link = 'index.php?option=com_mijosearch&task=search&Itemid='. JRequest::getInt('Itemid');

			$filter = JRequest::getInt('filter');
			if (!empty($filter)) {
				$link .= '&filter='.$filter;
			}
		}

        $counter = 0;
		foreach($suggestions AS $suggestion) {
			$suggestion = trim($suggestion);

            if (empty($suggestion) || strlen($suggestion) <= 2) {
                continue;
            }

            $html .= '<strong><a style="color:#1d82fe;" href="'.JRoute::_($link."&suggest=".$suggestion).'" title="'.$suggestion.'">'.$suggestion.'</a></strong>, ';

            $counter++;
            if ($counter == 10) {
                break;
            }
		}

        $html = rtrim($html, ', ');

		$html .= ' ?';
		$html .= '</div>';
		$html .= '<br />';

		return $html;
	}
    
	// MijoSearch
	protected function mijosearch() {
		$suggestions = array();
		
		$words = MijoDatabase::loadResultArray("SELECT DISTINCT keyword FROM #__mijosearch_search_results WHERE search_result > '0' GROUP BY keyword ORDER BY search_result DESC");

		if (empty($words) || !is_array($words)) {
			return $suggestions;
		}
		
		$closest = array();

        $queries = explode(' ', $this->input);

        foreach($queries as $q) {
			$q = trim($q);
			
			if (empty($q)) {
				continue;
			}
			
			foreach ($words as $word) {
				$word = trim($word);

				if (isset($suggestions[$word])) {
					continue;
				}

				$lv = levenshtein(strtolower($this->input), strtolower($word));
				if ($lv == 0) {
					return "";
				}

				if ($lv < 5) {
					$suggestions[$word] = $word;
				}
				else {
					$lev = levenshtein(strtolower($q), strtolower($word));

					if ($lev == 1) {
						$suggestions[$word] = $word;
					}
					elseif ($lev < 5) {
						$closest[$word] = $word;
					}
				}
			}

			$ads = count($closest) ? implode(' ', $closest) : '';
			if (!empty($ads)) {
				if (!isset($suggestions[$ads])) {
					$suggestions[$ads] = $ads;
				}
			}
		}

        return $suggestions;
    }
    
	// Google
	protected function google() {
		$suggestions = array();
		
		$url = "http://suggestqueries.google.com/complete/search?output=toolbar&hl=".substr($this->lang, 0, 2)."&q=".$this->input;
		
        $response = MijoSearchUtility::getRemoteData($url);
		
		$manifest = simplexml_load_string($response);

        if (!is_object($manifest) or ((string)$manifest->attributes()->error == '1') or (count($manifest->children()) == 0)) {
            return $suggestions;
        }

        $childrens = $manifest->children();
        
        foreach ($childrens as $children) {
            if (!($children instanceof SimpleXMLElement)) {
                continue;
            }

            $data = $children->suggestion;

            if (!empty($data)) {
                $suggestions = array_merge($suggestions, preg_split('/(?=\t)/', $data->attributes(), -1, PREG_SPLIT_NO_EMPTY));
            }
        }
		
		return $suggestions;
	}
    
	// Yahoo
	protected function yahoo() {
		$suggestions = array();

        if (empty($this->MijosearchConfig->suggestions_yahoo_key)) {
            return $suggestions;
        }
		
		$yahoo_url = "http://query.yahooapis.com/v1/public/yql";
        $yahoo_url .= 'select * from search.spelling where query = ' . JFactory::getDBO()->Quote(urldecode($this->input)) . ' and appid = "'.$this->MijosearchConfig->suggestions_yahoo_key.'"';
        $yahoo_url .= "?q=" . urlencode($this->input);
        $yahoo_url .= "&format=json";
        
        $results = json_decode(MijoSearch::get('utility')->getRemoteData($yahoo_url));

        if (!is_null(@$results->query->results)){
            $suggestions = array($results->query->results->suggestion);
        }
		
		return $suggestions;
	}
    
	// Bing
	protected function bing() {
		$suggestions = array();

        if (empty($this->MijosearchConfig->suggestions_bing_key)) {
            return $suggestions;
        }
		
        $bing_url = "http://api.search.live.net/json.aspx";
        $bing_url .= "?AppId=".$this->MijosearchConfig->suggestions_bing_key;
        $bing_url .= "&Query=".$this->input;
        $bing_url .= "&Sources=Spell";
        $bing_url .= "&Market=".$this->lang;
        $bing_url .= "&Options=DisableLocationDetection";

        $results = json_decode(MijoSearch::get('utility')->getRemoteData($bing_url));

        if (isset($results->SearchResponse->Spell)) {
            foreach($results->SearchResponse->Spell->Results as $value) {
                $suggestions[] = $value->Value;
            }
        }
		
		return $suggestions;
	}

	// PSpell
	protected function pspell() {
		$suggestions = array();

		if (!function_exists('pspell_new') || !is_callable('pspell_new')) {
			return $suggestions;
		}

		$pspell_url = pspell_new($this->lang, '', '', 'utf-8', PSPELL_FAST);

		$suggestions = pspell_suggest($pspell_url, $this->input);

		return $suggestions;
	}
}