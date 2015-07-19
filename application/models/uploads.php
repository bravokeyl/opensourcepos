<?php
class Uploads extends CI_Model
{
	var $lib = '';
	var $table = '';
	var $subdir = '';
	function __construct() {
		parent::__construct();
		$this->table = 'uploads';
	}

	public function upload() {
		$post = $this->input->post();
		$this->subdir = $post['target'];
		switch ($post['target']) {
			case 'receivings':
				$this->load->library('receiving_lib');
				$ids = $this->{$post['upload_mode']}();

				if(count($ids) > 0) {
					$this->receiving_lib->update_item_attachments($post['item_id'], $ids);
				}
				redirect('receivings');
				break;
			
			default:
				# code...
				break;
		}
	}

	private function multi() {
		if(!isset($_FILES['files']) || count($_FILES['files']) == 0) {
			return false;
		}

		$ids = array();
		for($f = 0; $f < count($_FILES['files']['name']); $f++) {
			if($_FILES['files']['error'][$f] > 0)
				continue;

			$file = array(
				'name' => $_FILES['files']['name'][$f],
				'type' => $_FILES['files']['type'][$f],
				'tmp_name' => $_FILES['files']['tmp_name'][$f],
				'error' => $_FILES['files']['error'][$f]
			);


			$insert = array(
				'name' => $file['name'],
				'type' => $file['type']
			);

			$this->db->insert($this->table, $insert);
			$id = $this->db->insert_id();

			$update = array(
				'filename' => 'uploads/' . $this->subdir . '/' . md5($id)
			);
			$this->db->where('id' , $id)
					->update($this->table, $update);

			$ids[] = $id;

			$upload_dir = FCPATH . '/uploads/' . $this->subdir;

			if(!is_dir($upload_dir))
				mkdir($upload_dir);

			move_uploaded_file($file['tmp_name'], "$upload_dir/" . md5($id));
		}

		return $ids;
	}

	function get_info($ids) {
		if(!$ids OR count($ids) == 0)
			return false;

		$files = array();
		foreach ($ids as $id) {
			$file = $this->db->where('id', $id)
							->get($this->table)
							->row_array();

			if(!isset($file['id']))
				continue;

			$files[] = $file;
		}

		return $files;
	}

	function destroy($id = null) {
		if(!is_null($id)) {
			$file = $this->db->where('id', $id)
							->get($this->table)
							->row_array();

			if(isset($file['id']) && file_exists(FCPATH . '/' . $file['filename'])) {
				unlink(FCPATH . '/' . $file['filename']);
			}
			
			return $this->db->delete($this->table, array('id' => $id));
		}
	}
}