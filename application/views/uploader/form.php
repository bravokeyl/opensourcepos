
<style type="text/css">
	#TB_window {
		bottom: 40% !important;
	}
	.submit_button {
		float: right;
	}

	#attachments_wrapper .table-responsive {
		margin-top: 15px !important;
		margin-bottom: 15px !important;
	}

	#TB_ajaxContent {
		padding-right: 0px !important;
	}
</style>

<div id="attachments_wrapper">
	<div class="table-responsive">
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Delete</th>
					<th>Attachment</th>
				</tr>
			</thead>
			<tbody>
				<?php if(!isset($attachments) OR count($attachments) == 0 OR !$attachments) { ?>
					<tr>
						<td colspan="100%">
							<div class='warning_message' style='padding:7px;'>
							<?php echo $this->lang->line('common_no_attachments'); ?>
							</div>
						</td>
					</tr>
				<?php } else { 
					foreach ($attachments as $attachment) {
				?>
					<tr>
						<td class="delete_attachment">
							<?php echo anchor("receivings/delete_attachment/{$attachment['id']}",'['.$this->lang->line('common_delete').']');?>
						</td>
						<td>
							<?php echo $attachment['name'];?>
						</td>
					</tr>
				<?php }} ?>
			</tbody>
		</table>
	</div>
	<?php
	echo form_open('uploader/upload', array('id' => 'uploader_form', 'enctype' => 'multipart/form-data'));
	?>

	<input type="hidden" name="item_id" value="<?php echo $item_id;?>" />
	<input type="hidden" name="target" value="<?php echo $target;?>" />
	<input type="hidden" name="upload_mode" value="multi" />
	<div>
		<input type="file" style="float: left" multiple name="files[]" id="files"
			accept="application/pdf,.csv,.xls,.xlsx application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />
		<?php

		echo form_submit(array(
			'name'=>'submit',
			'id'=>'submit',
			'value'=>$this->lang->line('common_submit'),
			'class'=>'submit_button')
		);

		?>
	</div>

	<?php
	echo form_close();
	?>
</div>

<script type="text/javascript">
	$('#uploader_form').submit(function (e) {
		var files = $("#files").val();
		if(files.trim().length === 0) {
			e.preventDefault();
			alert('You did not select a file!');
		}
	});

	$('.delete_attachment a').click(function(e) {
		e.preventDefault();

		var url = $(this).attr('href'),
			me = $(this);
		$.ajax({
			url: url,
			data: {
				item_id: <?php echo $item_id;?>
			},
			dataType: 'json',
			success: function(response) {
				if(!response || response.success === false) {
					alert(response.responseText || 'Unable to delete attachment!');
					return false;
				}
				me.parent().parent().fadeOut(100, function() {
					$(this).remove();
				});
			},
			error: function(response) {
				console.log(response);
			}
		});
	});	
</script>