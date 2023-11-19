<div class="container">
<div class="container mt-4">
    <h1 class="display-4"><?= $judul; ?></h1>
    <hr>
</div>

<div class="container mt-2">
    <?= $this->session->flashdata('message'); ?>
    <table class="table table-sm">
    <thead>
        <tr>        
        <th scope="col">Kode Bus</th>
        <th scope="col">Tgl Berangkat</th>
        <th class="text-center" scope="col">Jumlah Kursi Yang Di Pesan</th>
        <th scope="col">Jam Keberangkatan</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ( $pemesanan as $p ){ ?>
        <tr>
        <form action="<?= base_url('user/pemesanan'); ?>" method="post"> 
            <td><?= $p->kode_bis ?></td>
            <td><?= $p->tgl_berangkat ?></td>
            <td class="text-center"><?= $p->kursi ?></td>
            <td><?= $p->jam_berangkat ?></td>
            <td><?= $p->status ?></td>
            <input type="text" hidden name="id_pesan" value="<?= $p->id_pesan ?>">
            <input type="text" hidden name="kode_bis" value="<?= $p->kode_bis ?>">
            <input type="text" hidden name="rute" value="<?= $p->rute ?>">
            <input type="text" hidden name="jam_berangkat" value="<?= $p->jam_berangkat ?>">
            <input type="text" hidden name="harga" value="<?= $p->harga ?>">
            <input type="text" hidden name="tgl_berangkat" value="<?= $p->tgl_berangkat ?>">
            <input type="text" hidden name="kursi" value="<?= $p->kursi ?>">
            <td>
                <button type="submit" class="btn btn-success">Bayar</button>
                <a href="<?= base_url();?>user/batalbooking/<?= $p->id_pesan ?>" class="btn btn-danger">Batalkan</a>
            </td>
        </form>
        </tr>
    <?php } ?>        
    </tbody>
    </table>
</div>
</div>