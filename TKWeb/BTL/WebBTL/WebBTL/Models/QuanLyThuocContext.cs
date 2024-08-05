using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WebBTL.Models;

public partial class QuanLyThuocContext : DbContext
{
    public QuanLyThuocContext()
    {
    }

    public QuanLyThuocContext(DbContextOptions<QuanLyThuocContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TAnhChiTietSp> TAnhChiTietSps { get; set; }

    public virtual DbSet<TAnhSanPham> TAnhSanPhams { get; set; }

    public virtual DbSet<TChiTietHdb> TChiTietHdbs { get; set; }

    public virtual DbSet<TChiTietHdn> TChiTietHdns { get; set; }

    public virtual DbSet<TChiTietSanPham> TChiTietSanPhams { get; set; }

    public virtual DbSet<TChuyenMon> TChuyenMons { get; set; }

    public virtual DbSet<TDanhMucThuoc> TDanhMucThuocs { get; set; }

    public virtual DbSet<TDonViTinh> TDonViTinhs { get; set; }

    public virtual DbSet<TDuocSi> TDuocSis { get; set; }

    public virtual DbSet<THoaDonBan> THoaDonBans { get; set; }

    public virtual DbSet<THoaDonNhap> THoaDonNhaps { get; set; }

    public virtual DbSet<TKhach> TKhaches { get; set; }

    public virtual DbSet<TLoaiThuoc> TLoaiThuocs { get; set; }

    public virtual DbSet<TNhaCungCap> TNhaCungCaps { get; set; }

    public virtual DbSet<TNuocSanXuat> TNuocSanXuats { get; set; }

    public virtual DbSet<TTrinhDo> TTrinhDos { get; set; }

    public virtual DbSet<TUser> TUsers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-9CMEP2V\\SQLEXPRESS;Initial Catalog=QuanLyThuoc;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TAnhChiTietSp>(entity =>
        {
            entity.HasKey(e => new { e.MaChiTietSp, e.TenFileAnh });

            entity.ToTable("tAnhChiTietSp");

            entity.Property(e => e.MaChiTietSp).HasMaxLength(50);
            entity.Property(e => e.TenFileAnh).HasMaxLength(50);
            entity.Property(e => e.Vitri).HasMaxLength(50);

            entity.HasOne(d => d.MaChiTietSpNavigation).WithMany(p => p.TAnhChiTietSps)
                .HasForeignKey(d => d.MaChiTietSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tAnhChiTietSp_tChiTietSanPham");
        });

        modelBuilder.Entity<TAnhSanPham>(entity =>
        {
            entity.HasKey(e => new { e.TenFileAnh, e.MaThuoc });

            entity.ToTable("tAnhSanPham");

            entity.Property(e => e.TenFileAnh).HasMaxLength(50);
            entity.Property(e => e.MaThuoc).HasMaxLength(50);
            entity.Property(e => e.Vitri).HasMaxLength(50);

            entity.HasOne(d => d.MaThuocNavigation).WithMany(p => p.TAnhSanPhams)
                .HasForeignKey(d => d.MaThuoc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tAnhSanPham_tDanhMucThuoc");
        });

        modelBuilder.Entity<TChiTietHdb>(entity =>
        {
            entity.HasKey(e => new { e.MaHdb, e.MaChiTietSp });

            entity.ToTable("tChiTietHDB");

            entity.Property(e => e.MaHdb)
                .HasMaxLength(50)
                .HasColumnName("MaHDB");
            entity.Property(e => e.MaChiTietSp).HasMaxLength(50);
            entity.Property(e => e.DonGiaBan).HasColumnType("money");
            entity.Property(e => e.GiamGia).HasMaxLength(50);
            entity.Property(e => e.Slban).HasColumnName("SLBan");

            entity.HasOne(d => d.MaChiTietSpNavigation).WithMany(p => p.TChiTietHdbs)
                .HasForeignKey(d => d.MaChiTietSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tChiTietHDB_tChiTietSanPham");

            entity.HasOne(d => d.MaHdbNavigation).WithMany(p => p.TChiTietHdbs)
                .HasForeignKey(d => d.MaHdb)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tChiTietHDB_tHoaDonBan");
        });

        modelBuilder.Entity<TChiTietHdn>(entity =>
        {
            entity.HasKey(e => new { e.MaHdn, e.MaThuoc });

            entity.ToTable("tChiTietHDN");

            entity.Property(e => e.MaHdn)
                .HasMaxLength(50)
                .HasColumnName("MaHDN");
            entity.Property(e => e.MaThuoc).HasMaxLength(50);
            entity.Property(e => e.DonGiaNhap).HasColumnType("money");
            entity.Property(e => e.GiamGia).HasMaxLength(50);
            entity.Property(e => e.Slnhap).HasColumnName("SLNhap");

            entity.HasOne(d => d.MaHdnNavigation).WithMany(p => p.TChiTietHdns)
                .HasForeignKey(d => d.MaHdn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tChiTietHDN_tHoaDonNhap");

            entity.HasOne(d => d.MaThuocNavigation).WithMany(p => p.TChiTietHdns)
                .HasForeignKey(d => d.MaThuoc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tChiTietHDN_tDanhMucThuoc");
        });

        modelBuilder.Entity<TChiTietSanPham>(entity =>
        {
            entity.HasKey(e => e.MaChiTietSp);

            entity.ToTable("tChiTietSanPham");

            entity.Property(e => e.MaChiTietSp).HasMaxLength(50);
            entity.Property(e => e.AnhDaiDien).HasMaxLength(50);
            entity.Property(e => e.DonGiaBan).HasColumnType("money");
            entity.Property(e => e.GiamGia).HasMaxLength(50);
            entity.Property(e => e.MaThuoc).HasMaxLength(50);
            entity.Property(e => e.Slton).HasColumnName("SLTon");

            entity.HasOne(d => d.MaThuocNavigation).WithMany(p => p.TChiTietSanPhams)
                .HasForeignKey(d => d.MaThuoc)
                .HasConstraintName("FK_tChiTietSanPham_tDanhMucThuoc");
        });

        modelBuilder.Entity<TChuyenMon>(entity =>
        {
            entity.HasKey(e => e.MaChuyenMon);

            entity.ToTable("tChuyenMon");

            entity.Property(e => e.MaChuyenMon).HasMaxLength(50);
            entity.Property(e => e.TenChuyenMon).HasMaxLength(200);
        });

        modelBuilder.Entity<TDanhMucThuoc>(entity =>
        {
            entity.HasKey(e => e.MaThuoc);

            entity.ToTable("tDanhMucThuoc");

            entity.Property(e => e.MaThuoc).HasMaxLength(50);
            entity.Property(e => e.AnhDaiDien).HasMaxLength(50);
            entity.Property(e => e.BaoQuan).HasMaxLength(200);
            entity.Property(e => e.CongDung).HasMaxLength(200);
            entity.Property(e => e.DoiTuongSd)
                .HasMaxLength(200)
                .HasColumnName("DoiTuongSD");
            entity.Property(e => e.GiaLonNhat).HasColumnType("money");
            entity.Property(e => e.GiaNhoNhat).HasColumnType("money");
            entity.Property(e => e.HanSuDung).HasColumnType("datetime");
            entity.Property(e => e.LieuDung).HasMaxLength(200);
            entity.Property(e => e.LuyY).HasMaxLength(200);
            entity.Property(e => e.MaDvt)
                .HasMaxLength(50)
                .HasColumnName("MaDVT");
            entity.Property(e => e.MaLoai).HasMaxLength(50);
            entity.Property(e => e.MaNuocSx)
                .HasMaxLength(50)
                .HasColumnName("MaNuocSX");
            entity.Property(e => e.MoTaThuoc).HasMaxLength(200);
            entity.Property(e => e.NgaySanXuat).HasColumnType("datetime");
            entity.Property(e => e.TacDungPhu).HasMaxLength(200);
            entity.Property(e => e.TenThuoc).HasMaxLength(200);
            entity.Property(e => e.ThanhPhan).HasMaxLength(200);

            entity.HasOne(d => d.MaDvtNavigation).WithMany(p => p.TDanhMucThuocs)
                .HasForeignKey(d => d.MaDvt)
                .HasConstraintName("FK_tDanhMucThuoc_tDonViTinh");

            entity.HasOne(d => d.MaLoaiNavigation).WithMany(p => p.TDanhMucThuocs)
                .HasForeignKey(d => d.MaLoai)
                .HasConstraintName("FK_tDanhMucThuoc_tLoaiThuoc");

            entity.HasOne(d => d.MaNuocSxNavigation).WithMany(p => p.TDanhMucThuocs)
                .HasForeignKey(d => d.MaNuocSx)
                .HasConstraintName("FK_tDanhMucThuoc_tNuocSanXuat");
        });

        modelBuilder.Entity<TDonViTinh>(entity =>
        {
            entity.HasKey(e => e.MaDvt);

            entity.ToTable("tDonViTinh");

            entity.Property(e => e.MaDvt)
                .HasMaxLength(50)
                .HasColumnName("MaDVT");
            entity.Property(e => e.TenDvt)
                .HasMaxLength(50)
                .HasColumnName("TenDVT");
        });

        modelBuilder.Entity<TDuocSi>(entity =>
        {
            entity.HasKey(e => e.MaDs);

            entity.ToTable("tDuocSi");

            entity.Property(e => e.MaDs).HasMaxLength(50);
            entity.Property(e => e.GioiTinh).HasMaxLength(50);
            entity.Property(e => e.MaChuyenMon).HasMaxLength(50);
            entity.Property(e => e.MaTrinhDo).HasMaxLength(50);
            entity.Property(e => e.NgaySinh).HasColumnType("datetime");
            entity.Property(e => e.SoDienThoai).HasMaxLength(50);
            entity.Property(e => e.TenDs).HasMaxLength(50);
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .HasColumnName("username");

            entity.HasOne(d => d.MaChuyenMonNavigation).WithMany(p => p.TDuocSis)
                .HasForeignKey(d => d.MaChuyenMon)
                .HasConstraintName("FK_tDuocSi_tChuyenMon");

            entity.HasOne(d => d.MaTrinhDoNavigation).WithMany(p => p.TDuocSis)
                .HasForeignKey(d => d.MaTrinhDo)
                .HasConstraintName("FK_tDuocSi_tTrinhDo");

            entity.HasOne(d => d.UsernameNavigation).WithMany(p => p.TDuocSis)
                .HasForeignKey(d => d.Username)
                .HasConstraintName("FK_tDuocSi_tUser");
        });

        modelBuilder.Entity<THoaDonBan>(entity =>
        {
            entity.HasKey(e => e.MaHdb);

            entity.ToTable("tHoaDonBan");

            entity.Property(e => e.MaHdb)
                .HasMaxLength(50)
                .HasColumnName("MaHDB");
            entity.Property(e => e.GiamGia).HasMaxLength(50);
            entity.Property(e => e.MaDs)
                .HasMaxLength(50)
                .HasColumnName("MaDS");
            entity.Property(e => e.MaKh)
                .HasMaxLength(50)
                .HasColumnName("MaKH");
            entity.Property(e => e.NgayBan).HasColumnType("datetime");
            entity.Property(e => e.PhuongThucThanhToan).HasMaxLength(50);
            entity.Property(e => e.TongTienHd)
                .HasColumnType("money")
                .HasColumnName("TongTienHD");

            entity.HasOne(d => d.MaDsNavigation).WithMany(p => p.THoaDonBans)
                .HasForeignKey(d => d.MaDs)
                .HasConstraintName("FK_tHoaDonBan_tDuocSi");

            entity.HasOne(d => d.MaKhNavigation).WithMany(p => p.THoaDonBans)
                .HasForeignKey(d => d.MaKh)
                .HasConstraintName("FK_tHoaDonBan_tKhach");
        });

        modelBuilder.Entity<THoaDonNhap>(entity =>
        {
            entity.HasKey(e => e.MaHdn);

            entity.ToTable("tHoaDonNhap");

            entity.Property(e => e.MaHdn)
                .HasMaxLength(50)
                .HasColumnName("MaHDN");
            entity.Property(e => e.DonGiaNhap).HasColumnType("money");
            entity.Property(e => e.GiamGia).HasMaxLength(50);
            entity.Property(e => e.MaDs)
                .HasMaxLength(50)
                .HasColumnName("MaDS");
            entity.Property(e => e.MaNcc)
                .HasMaxLength(50)
                .HasColumnName("MaNCC");
            entity.Property(e => e.NgayNhap).HasColumnType("datetime");
            entity.Property(e => e.PhuongThucThanhToan).HasMaxLength(50);
            entity.Property(e => e.Slnhap).HasColumnName("SLNhap");
            entity.Property(e => e.TongTienHdn)
                .HasColumnType("money")
                .HasColumnName("TongTienHDN");

            entity.HasOne(d => d.MaDsNavigation).WithMany(p => p.THoaDonNhaps)
                .HasForeignKey(d => d.MaDs)
                .HasConstraintName("FK_tHoaDonNhap_tDuocSi");

            entity.HasOne(d => d.MaNccNavigation).WithMany(p => p.THoaDonNhaps)
                .HasForeignKey(d => d.MaNcc)
                .HasConstraintName("FK_tHoaDonNhap_tNhaCungCap");
        });

        modelBuilder.Entity<TKhach>(entity =>
        {
            entity.HasKey(e => e.MaKh);

            entity.ToTable("tKhach");

            entity.Property(e => e.MaKh)
                .HasMaxLength(50)
                .HasColumnName("MaKH");
            entity.Property(e => e.DiaChi).HasMaxLength(50);
            entity.Property(e => e.SoDienThoai).HasMaxLength(50);
            entity.Property(e => e.TenKh)
                .HasMaxLength(50)
                .HasColumnName("TenKH");
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .HasColumnName("username");

            entity.HasOne(d => d.UsernameNavigation).WithMany(p => p.TKhaches)
                .HasForeignKey(d => d.Username)
                .HasConstraintName("FK_tKhach_tUser");
        });

        modelBuilder.Entity<TLoaiThuoc>(entity =>
        {
            entity.HasKey(e => e.MaLoai);

            entity.ToTable("tLoaiThuoc");

            entity.Property(e => e.MaLoai).HasMaxLength(50);
            entity.Property(e => e.TenLoai).HasMaxLength(200);
        });

        modelBuilder.Entity<TNhaCungCap>(entity =>
        {
            entity.HasKey(e => e.MaNcc);

            entity.ToTable("tNhaCungCap");

            entity.Property(e => e.MaNcc)
                .HasMaxLength(50)
                .HasColumnName("MaNCC");
            entity.Property(e => e.DiaChi).HasMaxLength(50);
            entity.Property(e => e.SoDienThoai).HasMaxLength(50);
            entity.Property(e => e.TenNcc)
                .HasMaxLength(200)
                .HasColumnName("TenNCC");
        });

        modelBuilder.Entity<TNuocSanXuat>(entity =>
        {
            entity.HasKey(e => e.MaNuocSx);

            entity.ToTable("tNuocSanXuat");

            entity.Property(e => e.MaNuocSx)
                .HasMaxLength(50)
                .HasColumnName("MaNuocSX");
            entity.Property(e => e.TenNuocSx)
                .HasMaxLength(50)
                .HasColumnName("TenNuocSX");
        });

        modelBuilder.Entity<TTrinhDo>(entity =>
        {
            entity.HasKey(e => e.MaTrinhDo);

            entity.ToTable("tTrinhDo");

            entity.Property(e => e.MaTrinhDo).HasMaxLength(50);
            entity.Property(e => e.TenTrinhDo).HasMaxLength(50);
        });

        modelBuilder.Entity<TUser>(entity =>
        {
            entity.HasKey(e => e.Username);

            entity.ToTable("tUser");

            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .HasColumnName("username");
            entity.Property(e => e.LoaiUser).HasMaxLength(50);
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .HasColumnName("password");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
