<div class="container-fluid">
    <div class="row g-0">
        <div class="col-5 offset-1">
            <div class="card border" style="border-top-left-radius: 10px;border-bottom-left-radius: 10px;">
                <div class="card-body">
                    <h1 class="card-title mt-5 text-center mb-4"><?= $judul; ?></h1>
                    <?= $this->session->flashdata('message'); ?>
                    <form action="<?= base_url('login/daftar'); ?>" method="post">
                        <div class="inputBox">
                            <input type="text" name="name" required="" value="<?= set_value('name'); ?>">
                            <label for="name">Nama Lengkap</label>
                            <?= form_error('name', '<small class="text-danger pl-3">', '</small>')?>
                        </div>
                        <div class="inputBox">
                            <input type="number" name="no_telp" required="" value="<?= set_value('no_telp'); ?>">
                            <label for="no_telp">Nomor Telepon</label>
                            <?= form_error('no_telp', '<small class="text-danger pl-3">', '</small>')?>
                        </div>
                        <div class="inputBox">
                            <input type="text" name="email" required="" value="<?= set_value('email'); ?>">
                            <label for="email">Alamat Email</label>
                            <?= form_error('email', '<small class="text-danger pl-3">', '</small>')?>
                        </div>
                        <div class="inputBox">
                            <input type="password" name="password" required="">
                            <label for="password">Password</label>
                            <?= form_error('password', '<small class="text-danger pl-3">', '</small>')?>
                        </div>
                        <div class="inputBox">
                            <input type="password" name="confirm_password" required="">
                            <label for="confirm_password">Konfirmasi Password</label>
                            <?= form_error('confirm_password', '<small class="text-danger pl-3">', '</small>')?>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="mb-3 btn btn-primary"><?= $judul; ?></button>
                        </div>
                        <p class="text-center">Sudah punya akun ? <a href="<?= base_url('login'); ?>">Login</a></p>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-5 bg-white d-flex justify-content-center align-items-center" style="border-top-right-radius: 10px;border-bottom-right-radius: 10px;">
            <img class="w-75" src="<?= base_url('assets/image/daftar.jpg'); ?>" alt="">
        </div>
    </div>
</div>