<div class="container">
<div class="container mt-4">
    <h1 class="display-4"><?= $judul; ?></h1>
</div>

<div class="container">
    <div class="row">
        <div class="col-6">
            <div class="card">
                <div class="display-4 mx-auto"><?= $pemesanan['id_pesan']; ?></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <form action="">
                <div class="row">
                    <div class="col-sm-4">
                        <label for="">Nama :</label>
                        <input type="text" class="form-control" value="<?= $user['nama']; ?>" readonly>
                    </div>
                    <div class="col-sm-4">
                        <label for="">Kode Pembayaran :</label>
                        <input type="text" class="form-control" value="<?= $pemesanan['id_pesan']; ?>" readonly>
                    </div>
                    <div class="col-sm-4">
                        <label for="">Tujuan :</label>
                        <input type="text" class="form-control" value="<?= $pemesanan['rute']; ?>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <label for="">Jam Keberangkatan :</label>
                        <input type="text" class="form-control" value="<?= $pemesanan['jam_berangkat']; ?>" readonly>
                    </div>
                    <div class="col-sm-6">
                        <label for="">Harga :</label>
                        <input type="text" class="form-control" value="<?= $pemesanan['harga']; ?>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <label for="">Kursi yang di pesan :</label>
                        <input type="text" class="form-control" value="<?= $pemesanan['kursi']; ?>" readonly>
                    </div>
                    <div class="col-sm-4">
                        <label for="">Tanggal Berangkat :</label>
                        <input type="text" class="form-control" value="<?= $pemesanan['tgl_berangkat']; ?>" readonly>
                    </div>
                    <div class="col-sm-4">
                        <label for="">Status Pembayaran :</label>
                        <input type="text" class="form-control" value="Sudah Bayar" readonly>
                    </div>
                </div>
            </form>  
        </div> 
    </div>
</div>

<div class="container text-right mb-5">
    <hr>
    <h5 class="mt-5">Total Bayar : Rp.<?= $pemesanan['harga'] * $pemesanan['kursi'];?></h5>
    <a href="" onclick="print()" class="btn btn-danger float-left mt-3"><i class="fas fa-print"></i> Cetak Bukti</a>
    <a href="<?= base_url('user'); ?>" class="btn btn-success mt-3">Kembali Memesan</a>
</div>
</div>