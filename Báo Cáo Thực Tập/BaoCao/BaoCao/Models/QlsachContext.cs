using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace BaoCao.Models;

public partial class QlsachContext : DbContext
{
    public QlsachContext()
    {
    }

    public QlsachContext(DbContextOptions<QlsachContext> options)
        : base(options)
    {
    }

    public virtual DbSet<AnhSach> AnhSaches { get; set; }

    public virtual DbSet<ChiTietHoaDon> ChiTietHoaDons { get; set; }

    public virtual DbSet<ChiTietSach> ChiTietSaches { get; set; }

    public virtual DbSet<HoaDonBan> HoaDonBans { get; set; }

    public virtual DbSet<KhachHang> KhachHangs { get; set; }

    public virtual DbSet<NhaPhatHanh> NhaPhatHanhs { get; set; }

    public virtual DbSet<NhaXuatBan> NhaXuatBans { get; set; }

    public virtual DbSet<NhanVien> NhanViens { get; set; }

    public virtual DbSet<Sach> Saches { get; set; }

    public virtual DbSet<TheLoai> TheLoais { get; set; }

    public virtual DbSet<Username> Usernames { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-9CMEP2V\\SQLEXPRESS;Initial Catalog=QLSach;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<AnhSach>(entity =>
        {
            entity.HasKey(e => new { e.MaSach, e.TenFileAnh });

            entity.ToTable("AnhSach");

            entity.Property(e => e.MaSach).HasMaxLength(50);
            entity.Property(e => e.TenFileAnh).HasMaxLength(50);
            entity.Property(e => e.Vitri).HasMaxLength(50);

            entity.HasOne(d => d.MaSachNavigation).WithMany(p => p.AnhSaches)
                .HasForeignKey(d => d.MaSach)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnhSach_Sach");
        });

        modelBuilder.Entity<ChiTietHoaDon>(entity =>
        {
            entity.HasKey(e => new { e.MaHdb, e.MaChiTietSp });

            entity.ToTable("ChiTietHoaDon");

            entity.Property(e => e.MaHdb)
                .HasMaxLength(50)
                .HasColumnName("MaHDB");
            entity.Property(e => e.MaChiTietSp)
                .HasMaxLength(50)
                .HasColumnName("MaChiTietSP");
            entity.Property(e => e.DonGiaBan).HasMaxLength(50);
            entity.Property(e => e.GiamGia).HasMaxLength(50);
            entity.Property(e => e.Slban).HasColumnName("SLBan");

            entity.HasOne(d => d.MaChiTietSpNavigation).WithMany(p => p.ChiTietHoaDons)
                .HasForeignKey(d => d.MaChiTietSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietHoaDon_ChiTietSach");

            entity.HasOne(d => d.MaHdbNavigation).WithMany(p => p.ChiTietHoaDons)
                .HasForeignKey(d => d.MaHdb)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietHoaDon_HoaDonBan");
        });

        modelBuilder.Entity<ChiTietSach>(entity =>
        {
            entity.HasKey(e => e.MaChiTietSp);

            entity.ToTable("ChiTietSach");

            entity.Property(e => e.MaChiTietSp)
                .HasMaxLength(50)
                .HasColumnName("MaChiTietSP");
            entity.Property(e => e.AnhDaiDien).HasMaxLength(50);
            entity.Property(e => e.DonGiaBan).HasMaxLength(50);
            entity.Property(e => e.GiamGia).HasMaxLength(50);
            entity.Property(e => e.MaSach).HasMaxLength(50);

            entity.HasOne(d => d.MaSachNavigation).WithMany(p => p.ChiTietSaches)
                .HasForeignKey(d => d.MaSach)
                .HasConstraintName("FK_ChiTietSach_Sach");
        });

        modelBuilder.Entity<HoaDonBan>(entity =>
        {
            entity.HasKey(e => e.MaHdb);

            entity.ToTable("HoaDonBan");

            entity.Property(e => e.MaHdb)
                .HasMaxLength(50)
                .HasColumnName("MaHDB");
            entity.Property(e => e.GiamGia).HasMaxLength(50);
            entity.Property(e => e.MaKh)
                .HasMaxLength(50)
                .HasColumnName("MaKH");
            entity.Property(e => e.MaNv)
                .HasMaxLength(50)
                .HasColumnName("MaNV");
            entity.Property(e => e.NgayBan).HasColumnType("datetime");
            entity.Property(e => e.PhuongThucThanhToan).HasMaxLength(50);
            entity.Property(e => e.TongTien).HasMaxLength(50);

            entity.HasOne(d => d.MaKhNavigation).WithMany(p => p.HoaDonBans)
                .HasForeignKey(d => d.MaKh)
                .HasConstraintName("FK_HoaDonBan_KhachHang");

            entity.HasOne(d => d.MaNvNavigation).WithMany(p => p.HoaDonBans)
                .HasForeignKey(d => d.MaNv)
                .HasConstraintName("FK_HoaDonBan_NhanVien");
        });

        modelBuilder.Entity<KhachHang>(entity =>
        {
            entity.HasKey(e => e.MaKh);

            entity.ToTable("KhachHang");

            entity.Property(e => e.MaKh)
                .HasMaxLength(50)
                .HasColumnName("MaKH");
            entity.Property(e => e.DiaChi).HasMaxLength(50);
            entity.Property(e => e.Sdt)
                .HasMaxLength(50)
                .HasColumnName("SDT");
            entity.Property(e => e.TenKh)
                .HasMaxLength(50)
                .HasColumnName("TenKH");
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .HasColumnName("username");

            entity.HasOne(d => d.UsernameNavigation).WithMany(p => p.KhachHangs)
                .HasForeignKey(d => d.Username)
                .HasConstraintName("FK_KhachHang_Username");
        });

        modelBuilder.Entity<NhaPhatHanh>(entity =>
        {
            entity.HasKey(e => e.MaNph);

            entity.ToTable("NhaPhatHanh");

            entity.Property(e => e.MaNph)
                .HasMaxLength(50)
                .HasColumnName("MaNPH");
            entity.Property(e => e.TenNph)
                .HasMaxLength(50)
                .HasColumnName("TenNPH");
            entity.Property(e => e.ThongTinNph)
                .HasMaxLength(500)
                .HasColumnName("ThongTinNPH");
        });

        modelBuilder.Entity<NhaXuatBan>(entity =>
        {
            entity.HasKey(e => e.MaNxb);

            entity.ToTable("NhaXuatBan");

            entity.Property(e => e.MaNxb)
                .HasMaxLength(50)
                .HasColumnName("MaNXB");
            entity.Property(e => e.TenNxb)
                .HasMaxLength(50)
                .HasColumnName("TenNXB");
            entity.Property(e => e.ThongTinNxb)
                .HasMaxLength(500)
                .HasColumnName("ThongTinNXB");
        });

        modelBuilder.Entity<NhanVien>(entity =>
        {
            entity.HasKey(e => e.MaNv);

            entity.ToTable("NhanVien");

            entity.Property(e => e.MaNv)
                .HasMaxLength(50)
                .HasColumnName("MaNV");
            entity.Property(e => e.ChucVu).HasMaxLength(50);
            entity.Property(e => e.DiaChi).HasMaxLength(50);
            entity.Property(e => e.NgaySinh).HasColumnType("datetime");
            entity.Property(e => e.Sdt)
                .HasMaxLength(50)
                .HasColumnName("SDT");
            entity.Property(e => e.TenNv)
                .HasMaxLength(50)
                .HasColumnName("TenNV");
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .HasColumnName("username");

            entity.HasOne(d => d.UsernameNavigation).WithMany(p => p.NhanViens)
                .HasForeignKey(d => d.Username)
                .HasConstraintName("FK_NhanVien_Username");
        });

        modelBuilder.Entity<Sach>(entity =>
        {
            entity.HasKey(e => e.MaSach);

            entity.ToTable("Sach");

            entity.Property(e => e.MaSach).HasMaxLength(50);
            entity.Property(e => e.Anh).HasMaxLength(50);
            entity.Property(e => e.DinhDang).HasMaxLength(50);
            entity.Property(e => e.KhoiLuong).HasMaxLength(50);
            entity.Property(e => e.MaNxb)
                .HasMaxLength(50)
                .HasColumnName("MaNXB");
            entity.Property(e => e.MaNxh)
                .HasMaxLength(50)
                .HasColumnName("MaNXH");
            entity.Property(e => e.MaTheLoai).HasMaxLength(50);
            entity.Property(e => e.MoTa).HasMaxLength(200);
            entity.Property(e => e.NgayPhatHanh).HasColumnType("datetime");
            entity.Property(e => e.NgonNgu).HasMaxLength(50);
            entity.Property(e => e.TacGia).HasMaxLength(50);
            entity.Property(e => e.TenSach).HasMaxLength(200);

            entity.HasOne(d => d.MaNxbNavigation).WithMany(p => p.Saches)
                .HasForeignKey(d => d.MaNxb)
                .HasConstraintName("FK_Sach_NhaXuatBan");

            entity.HasOne(d => d.MaNxhNavigation).WithMany(p => p.Saches)
                .HasForeignKey(d => d.MaNxh)
                .HasConstraintName("FK_Sach_NhaPhatHanh");

            entity.HasOne(d => d.MaTheLoaiNavigation).WithMany(p => p.Saches)
                .HasForeignKey(d => d.MaTheLoai)
                .HasConstraintName("FK_Sach_TheLoai");
        });

        modelBuilder.Entity<TheLoai>(entity =>
        {
            entity.HasKey(e => e.MaTheLoai);

            entity.ToTable("TheLoai");

            entity.Property(e => e.MaTheLoai).HasMaxLength(50);
            entity.Property(e => e.TenTheLoai).HasMaxLength(50);
        });

        modelBuilder.Entity<Username>(entity =>
        {
            entity.HasKey(e => e.Username1);

            entity.ToTable("Username");

            entity.Property(e => e.Username1)
                .HasMaxLength(50)
                .HasColumnName("username");
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .HasColumnName("password");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
