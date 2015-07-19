<?php
class Uploader extends CI_Controller
{
    function __construct() {
        parent::__construct();
        $this->load->model('uploads');
    }
    
    function view($parm) {
        $parms = explode(':', $parm);
        $data['item_id'] = $parms[0];
        $data['target'] = $parms[1];
        $data['attachments'] = $this->get_items($data['target'], $data['item_id']);
        $this->load->view("uploader/form", $data);
    }
    
    function upload() {
        $this->uploads->upload();
    }

    function get_items($target, $item_id) {
        switch ($target) {
            case 'receivings':
                $this->load->library('receiving_lib');
                $ids = $this->receiving_lib->get_item_attachments($item_id);
                return $this->uploads->get_info($ids);
                break;
            
            default:
                # code...
                break;
        }
        return array();
    }
}
