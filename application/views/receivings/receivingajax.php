

<!-- Receiving Items List -->
	<table id="register" class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><?php echo $this->lang->line('common_delete'); ?></th>
				<th><?php echo $this->lang->line('recvs_item_name'); ?></th>
				<th><?php echo $this->lang->line('recvs_cost'); ?></th>
				<th><?php echo $this->lang->line('recvs_quantity'); ?></th>
				<th></th>
				<th><?php echo $this->lang->line('recvs_discount'); ?></th>
				<th><?php echo $this->lang->line('recvs_total'); ?></th>
				<th><?php echo $this->lang->line('recvs_item_vehicle_no'); ?></th>
				<th><?php echo $this->lang->line('recvs_item_driver_no'); ?></th>
				<th><?php echo $this->lang->line('recvs_item_project'); ?></th>
				<th><?php echo $this->lang->line('recvs_item_weight'); ?></th>
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
					<td colspan="3" class="text-left">
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

