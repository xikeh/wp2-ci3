<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model('M_bus');
	}

	// Function untuk tampilan login
	public function index(){
		if ($this->session->userdata('email')) {
			redirect('user');
		}

		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');
		if ($this->form_validation->run() == false) {
			$data['judul'] = "Login E-TIKBUS";
			$this->load->view('tamplate/header_login', $data);
			$this->load->view('login');
			$this->load->view('tamplate/footer_login');
		}
		else{
			// validasi sukses!
			$this->_login();
		}
	}

	// Funtion untuk form login
	private function _login(){
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$user = $this->db->get_where('user', ['email' => $email, 'password' => md5($password)])->row_array();
		
		if($user){ // jika usernya ada
			$data = [
				'email' => $user['email'],
				'id_role' => $user['id_role']
			];
			$this->session->set_userdata($data);
				if ($user['id_role'] == 1) {
					return redirect('admin');
				} else {
					return redirect('user');
				}
		}
		else {
			$this->session->set_flashdata('message', 'Akun Tidak Ditemukan!');
			redirect('login');
		}
	}

	// Function untuk daftar
	public function daftar(){
		if ($this->session->userdata('email')) {
			redirect('user');
		}
		
		$this->form_validation->set_rules('name', 'Nama', 'required|trim');
		$this->form_validation->set_rules('no_telp', 'Nomor telepon', 'required|trim');
		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[user.email]', [
			'is_unique' => 'Email Ini Telah Terdaftar!'
		]);
		$this->form_validation->set_rules('password', 'Password', 'required|trim', [
		]);
		$this->form_validation->set_rules('confirm_password', 'Konfirmasi password', 'required|trim|matches[password]', [
			'matches' => 'Password Tidak Cocok!'
		]);
		
		if ($this->form_validation->run() == false) {
			$data ['judul'] = 'Registrasi Pengguna Baru';
			$this->load->view('tamplate/header_login', $data);
			$this->load->view('daftar');
			$this->load->view('tamplate/footer_login');
		}
		else{
			$data = [
				'nama' => htmlspecialchars($this->input->post('name', true)),
				'no_telp' => htmlspecialchars($this->input->post('no_telp', true)),
				'email' => htmlspecialchars($this->input->post('email', true)),
				'password' => md5($this->input->post('password', true)),
				'id_role' => 2,
				'image' => 'default.jpg'
			];

			$this->db->insert('user', $data);
			$this->session->set_flashdata('message-success', 'Akun Berhasil Dibuat');
			redirect('login');
		}
	}

	// Function untuk logout
	public function logout(){
		// $this->session->sess_destroy();
		$this->session->unset_userdata('email');
		$this->session->unset_userdata('role_id');
		$this->session->set_flashdata('message-success', 'Anda Berhasil Logout!');
		redirect('login');
	}
}