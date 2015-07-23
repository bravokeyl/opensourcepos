<?php
class Workorder extends CI_Model
{
	public function getAllRecords()
	{
		
		
		return $this->db->get('ospos_workorder')->result_array();
	}
        
        public function getRecords($id)
	{
		
		$this->db->where('id',$id);
		return $this->db->get('ospos_workorder')->result_array();
	}
        
	function delete_order($itemno)
        {
          $this->db->delete('ospos_workorder',array('id'=>$itemno));  
          return true;
        }
        
        function get_factory($item_id){
            $this->db->where('item_id',$item_id);
            return $this->db->get('ospos_items')->result_array();
        }
	
}
?>
