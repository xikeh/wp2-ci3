<?php 
function _cekRole($name){
  $ci = get_instance();
  if($ci->session->userdata('id_role') != 1 && $name === 'admin') {
    redirect('user');
  }
  if($ci->session->userdata('id_role') != 2 && $name === 'user') {
    redirect('admin');
  }
}
?>