<?php
class Workorder extends CI_Model
{
	public function getAllRecords()
	{
		
		
		return $this->db->get('ospos_workorder')->result_array();
	}
	function delete_order($itemno)
        {
          $this->db->delete('ospos_workorder',array('id'=>$itemno));  
          return true;
        }
	
}
?>
