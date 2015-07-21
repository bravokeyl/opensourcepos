

<!-- Receiving Items List -->

	<table id="register" class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><?php echo $this->lang->line('common_delete'); ?></th>
				<th><?php echo $this->lang->line('recvs_item_name'); ?></th>
                                <th><?php echo $this->lang->line('recvs_vendor'); ?></th>
                          
                                <th><?php echo $this->lang->line('recvs_discount'); ?></th>
                                <th><?php echo $this->lang->line('recvs_item_vehicle_no'); ?></th>
                                <th><?php echo $this->lang->line('recvs_item_driver_no'); ?></th>
                                <th><?php echo $this->lang->line('recvs_credit'); ?></th>
                                <th><?php echo $this->lang->line('recvs_item_weight'); ?></th>
                                <th><?php echo $this->lang->line('recvs_price'); ?></th>
                                <th><?php echo $this->lang->line('recvs_item_project'); ?></th>
                                
                                <th><?php echo $this->lang->line('recvs_scrap'); ?></th>
                                <th><?php echo $this->lang->line('recvs_dvendor'); ?></th>


				<th><?php echo $this->lang->line('recvs_edit'); ?></th>
			</tr>
		</thead>
		<tbody id="cart_contents">
		<?php if($cart==0) { ?>
		<tr>
			<td colspan="100%">
				<div class='warning_message' style='padding:7px;'>
				<?php echo $this->lang->line('sales_no_items_in_cart'); ?>
				</div>
			</td>
		</tr> <!-- End no items Selected -->
		<?php
		} // no items in the cart
		else {
			foreach($workorder as $line=>$item) {
		        echo form_open_multipart("receivings/edit_order/{$item['id']}");
		    ?>
			    <tr>
			    	<td>
                                        <?php echo anchor("receivings/delete_order/{$item['id']}",'['.$this->lang->line('common_delete').']');?>
			    	</td>
					<td>
						<?php echo $item['item_name']; ?>
		            </td>
					
						<td><?php echo form_input(array('name'=>'vendor','value'=>$item['vendor'],'size'=>'6'));?></td>
					
					
					<td>
						<?php echo form_input(array('name'=>'discount_percent','value'=>$item['discount_percent'],'size'=>'2')); ?>
					</td>
					
					
					<td><?php echo form_input(array('name'=>'vehicle_no','value'=>$item['vehicle_no'],'size'=>'8'));?></td>
					<td><?php echo form_input(array('name'=>'driver_no','value'=>$item['driver_no'],'size'=>'8'));?></td>
					<td><?php echo form_input(array('name'=>'project','value'=>@$item['credit_limit'],'size'=>'8'));?></td>
					<td><?php echo form_input(array('name'=>'weight','value'=>$item['weight'],'size'=>'8'));?></td>
                                        <td><?php echo form_input(array('name'=>'price','value'=>$item['cost_price'],'size'=>'8'));?></td>
                                        <td><?php echo form_input(array('name'=>'project','value'=>$item['project'],'size'=>'8'));?></td>
                                        <td><?php echo form_input(array('name'=>'price','value'=>$item['scrap'],'size'=>'8'));?></td>
                                        <td><?php echo form_input(array('name'=>'price','value'=>@$item['dvendor'],'size'=>'8'));?></td>
					<td><?php echo form_submit("edit_item", $this->lang->line('sales_edit_item'));?></td>
				</tr>
				<tr>
					<?php  if($item['allow_alt_description']==1) { ?>
					<td style="color: #2F4F4F;"><?php echo $this->lang->line('sales_description_abbrv').':';?></td>
					<?php } ?>
					<td colspan="3" style="text-align: left;">
					<?php
			        	if($item['allow_alt_description']==1) {
			        		echo form_input(array('name'=>'description','value'=>$item['description'],'size'=>'20'));
			        	}
			        	else {
							if ($item['description']!='') {
								echo $item['description'];
			        			echo form_hidden('description',$item['description']);
			        		}
			        		else {
			        		    echo $this->lang->line('sales_no_description');
			           			echo form_hidden('description','');
			        		}
			        	}
					?>
					</td>
					<!-- <td colspan="6"></td> -->
					<td colspan="2" class="text-center"><b><?php echo $this->lang->line('recvs_item_date');?>:</b></td>
					<td colspan="2" class="text-left"><?php echo form_input(array('name'=>'item_date','value'=>$item['item_date'],'size'=>'15'));?></td>
					<td colspan="1" class="text-left"><?php echo $this->lang->line('recvs_item_attachment');?></td>
					<td colspan="4" class="text-left">
						<?php echo anchor("uploader/view/$line:receivings/width:500/height:350",
						"<div class='small_button'><span>". count(@$item['attachments']) . '&nbsp;'. $this->lang->line('recvs_item_attachment')."</span></div>",
						array('class'=>'thickbox none','title'=>$this->lang->line('recvs_item_attachment')));
						?>
					</td>
				</tr>
				</form>
			<?php
			}
		}
		?>
		</tbody>
	</table>
</div> <!-- End table responsive -->


<!-- Overall Receiving -->


<div class="clearfix" style="margin-bottom:30px;">&nbsp;</div>

<script type="text/javascript" language="javascript">
$(document).ready(function()
{
    $("#item").autocomplete('<?php echo site_url("receivings/item_search"); ?>',
    {
    	minChars:0,
    	max:100,
       	delay:10,
       	selectFirst: false,
    	formatItem: function(row) {
			return row[1];
		}
    });

    $("#item").result(function(event, data, formatted)
    {
		$("#add_item_form").submit();
    });

    $('#item').focus();

	$('#item').blur(function()
    {
    	$(this).attr('value',"<?php echo $this->lang->line('sales_start_typing_item_name'); ?>");
    });

	$('#comment').keyup(function() 
	{
		$.post('<?php echo site_url("receivings/set_comment");?>', {comment: $('#comment').val()});
	});

	$('#recv_invoice_number').keyup(function() 
	{
		$.post('<?php echo site_url("receivings/set_invoice_number");?>', {recv_invoice_number: $('#recv_invoice_number').val()});
	});

	$("#recv_print_after_sale").change(function()
	{
		$.post('<?php echo site_url("receivings/set_print_after_sale");?>', {recv_print_after_sale: $(this).is(":checked")});
	});

	var enable_invoice_number = function() 
	{
		var enabled = $("#recv_invoice_enable").is(":checked");
		$("#recv_invoice_number").prop("disabled", !enabled).parents('tr').show();
		return enabled;
	}

	enable_invoice_number();

	$("#recv_invoice_enable").change(function() {
		var enabled = enable_invoice_number();
		$.post('<?php echo site_url("receivings/set_invoice_number_enabled");?>', {recv_invoice_number_enabled: enabled});
		
	});

	$('#item,#supplier').click(function()
    {
    	$(this).attr('value','');
    });

    $("#supplier").autocomplete('<?php echo site_url("receivings/supplier_search"); ?>',
    {
    	minChars:0,
    	delay:10,
    	max:100,
    	formatItem: function(row) {
			return row[1];
		}
    });

    $("#supplier").result(function(event, data, formatted)
    {
		$("#select_supplier_form").submit();
    });

    $('#supplier').blur(function()
    {
    	$(this).attr('value',"<?php echo $this->lang->line('recvs_start_typing_supplier_name'); ?>");
    });

    $("#finish_receiving_button").click(function()
    {
    	if (confirm('<?php echo $this->lang->line("recvs_confirm_finish_receiving"); ?>'))
    	{
    		$('#finish_receiving_form').submit();
    	}
    });

    $("#cancel_receiving_button").click(function()
    {
    	if (confirm('<?php echo $this->lang->line("recvs_confirm_cancel_receiving"); ?>'))
    	{
    		$('#cancel_receiving_form').submit();
    	}
    });


});

function post_item_form_submit(response, stay_open)
{
	if(response.success)
	{
		$("#item").attr("value",response.item_id);
		if (stay_open)
		{
			$("#add_item_form").ajaxSubmit();
		}
		else
		{
			$("#add_item_form").submit();
		}
	}
}

function post_person_form_submit(response)
{
	if(response.success)
	{
		$("#supplier").attr("value",response.person_id);
		$("#select_supplier_form").submit();
	}
}