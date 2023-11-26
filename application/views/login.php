<div class="container">
    <div class="row g-0">
        <div class="col-5 offset-1 bg-white d-flex justify-content-center align-items-center" style="border-top-left-radius: 10px;border-bottom-left-radius: 10px;">
            <img class="w-75" src="<?= base_url('assets/image/img_bg.jpg'); ?>" alt="">
        </div>
        <div class="col-6">
            <div class="card">
                <div class="card-body">
                    <h1 class="card-title text-center mb-4"><?= $judul; ?></h1>
                    <?php if($this->session->flashdata('message')) { ?>
                    <div class="flash-data" data-flashdata="<?= $this->session->flashdata('message'); ?>"></div>
                    <?php } else if($this->session->flashdata('message-success')) {?>
                    <div class="flash-data-success" data-flashdata="<?= $this->session->flashdata('message-success'); ?>"></div>
                    <?php } ?>
                    <form action="<?= base_url('login'); ?>" method="post">
                        <div class="inputBox">
                            <input type="text" name="email" required="" value="<?= set_value('email'); ?>">
                            <label for="email">Email address</label>
                            <?= form_error('email', '<small class="text-danger pl-3">', '</small>')?>
                        </div>
                        <div class="inputBox">
                            <input type="password" name="password" required="">
                            <label for="password">Password</label>
                            <?= form_error('password', '<small class="text-danger pl-3">', '</small>')?>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="mb-3 btn btn-primary"><?= $judul; ?></button>
                        </div>
                        <p class="text-center">Belum Punya Akun? <a href="<?= base_url('login/daftar'); ?>">Daftar</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>