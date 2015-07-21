

<!-- Receiving Items List -->
<script type="text/javascript" src="js/thickbox.js" language="javascript"></script>
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

<!--				<th><?php echo $this->lang->line('recvs_cost'); ?></th>
				<th><?php echo $this->lang->line('recvs_quantity'); ?></th>
				<th></th>
				<th><?php echo $this->lang->line('recvs_discount'); ?></th>
				<th><?php echo $this->lang->line('recvs_total'); ?></th>
				<th><?php echo $this->lang->line('recvs_item_vehicle_no'); ?></th>
				<th><?php echo $this->lang->line('recvs_item_driver_no'); ?></th>
				<th><?php echo $this->lang->line('recvs_item_project'); ?></th>
				<th><?php echo $this->lang->line('recvs_item_weight'); ?></th>-->
				<th><?php echo $this->lang->line('recvs_edit'); ?></th>
			</tr>
		</thead>
		<tbody id="cart_contents">
		<?php if(count($cart)==0) { ?>
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
			foreach(array_reverse($cart, true) as $line=>$item) {
		        echo form_open_multipart("receivings/edit_item/$line");
		    ?>
			    <tr>
			    	<td>
			    		<?php echo anchor("receivings/delete_item/$line",'['.$this->lang->line('common_delete').']');?>
			    	</td>
					<td>
						<?php echo $item['name']; ?><br />[<?php echo $item['in_stock']; ?> in <?php echo $item['stock_name']; ?>]<?php echo form_hidden('location', $item['item_location']); ?>
		            </td>
					<?php 
					if ($items_module_allowed && $mode !='requisition') { ?>
						<td><?php echo form_input(array('name'=>'price','value'=>$item['price'],'size'=>'6'));?></td>
					<?php } // end not requisition
					else { ?>
						<td><?php echo $item['price']; ?></td>
						<?php echo form_hidden('price',$item['price']); ?>
					<?php }  // end requistion ?>
					<td>
						<?php echo form_input(array('name'=>'quantity','value'=>$item['quantity'],'size'=>'2')); ?>
					</td>
					<?php if ($item['receiving_quantity'] > 1) { ?>
		        	<td>x <?php echo $item['receiving_quantity']; ?></td>	
					<?php } // end if rec.qty >1 
				 	else { ?>
					<td></td>
					<?php } // end else rec.qty >1 ?>
				
					<?php       
					if ($items_module_allowed && $mode!='requisition') { ?>
			   			<td><?php echo form_input(array('name'=>'discount','value'=>$item['discount'],'size'=>'3'));?></td>
					<?php }
				    else { ?>
					    <td><?php echo $item['discount']; ?></td>
					    <?php echo form_hidden('discount',$item['discount']); 
				    } // end else 
				    ?>
					<td>
						<?php echo to_currency($item['price']*$item['quantity']-$item['price']*$item['quantity']*$item['discount']/100); ?>
					</td>
					<td><?php echo form_input(array('name'=>'vehicle_no','value'=>$item['vehicle_no'],'size'=>'8'));?></td>
					<td><?php echo form_input(array('name'=>'driver_no','value'=>$item['driver_no'],'size'=>'8'));?></td>
					<td><?php echo form_input(array('name'=>'project','value'=>$item['project'],'size'=>'8'));?></td>
					<td><?php echo form_input(array('name'=>'weight','value'=>$item['weight'],'size'=>'8'));?></td>
                                        					<td><?php echo form_input(array('name'=>'weight','value'=>$item['weight'],'size'=>'8'));?></td>

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
						"<div class='small_button'><span>". count($item['attachment_ids']) . '&nbsp;'. $this->lang->line('recvs_item_attachment')."</span></div>",
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