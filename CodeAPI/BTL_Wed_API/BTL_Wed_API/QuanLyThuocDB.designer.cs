﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BTL_Wed_API
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="API_Thuoc")]
	public partial class QuanLyThuocDBDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InserttNhaSanXuat(tNhaSanXuat instance);
    partial void UpdatetNhaSanXuat(tNhaSanXuat instance);
    partial void DeletetNhaSanXuat(tNhaSanXuat instance);
    partial void InserttNhomThuoc(tNhomThuoc instance);
    partial void UpdatetNhomThuoc(tNhomThuoc instance);
    partial void DeletetNhomThuoc(tNhomThuoc instance);
    partial void InserttThuoc(tThuoc instance);
    partial void UpdatetThuoc(tThuoc instance);
    partial void DeletetThuoc(tThuoc instance);
    #endregion
		
		public QuanLyThuocDBDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["API_ThuocConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public QuanLyThuocDBDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public QuanLyThuocDBDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public QuanLyThuocDBDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public QuanLyThuocDBDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<tNhaSanXuat> tNhaSanXuats
		{
			get
			{
				return this.GetTable<tNhaSanXuat>();
			}
		}
		
		public System.Data.Linq.Table<tNhomThuoc> tNhomThuocs
		{
			get
			{
				return this.GetTable<tNhomThuoc>();
			}
		}
		
		public System.Data.Linq.Table<tThuoc> tThuocs
		{
			get
			{
				return this.GetTable<tThuoc>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tNhaSanXuat")]
	public partial class tNhaSanXuat : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _MaNSX;
		
		private string _TenNSX;
		
		private string _DiaChi;
		
		private string _SoDT;
		
		private string _Mail;
		
		private EntitySet<tThuoc> _tThuocs;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnMaNSXChanging(string value);
    partial void OnMaNSXChanged();
    partial void OnTenNSXChanging(string value);
    partial void OnTenNSXChanged();
    partial void OnDiaChiChanging(string value);
    partial void OnDiaChiChanged();
    partial void OnSoDTChanging(string value);
    partial void OnSoDTChanged();
    partial void OnMailChanging(string value);
    partial void OnMailChanged();
    #endregion
		
		public tNhaSanXuat()
		{
			this._tThuocs = new EntitySet<tThuoc>(new Action<tThuoc>(this.attach_tThuocs), new Action<tThuoc>(this.detach_tThuocs));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaNSX", DbType="NVarChar(200) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string MaNSX
		{
			get
			{
				return this._MaNSX;
			}
			set
			{
				if ((this._MaNSX != value))
				{
					this.OnMaNSXChanging(value);
					this.SendPropertyChanging();
					this._MaNSX = value;
					this.SendPropertyChanged("MaNSX");
					this.OnMaNSXChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TenNSX", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string TenNSX
		{
			get
			{
				return this._TenNSX;
			}
			set
			{
				if ((this._TenNSX != value))
				{
					this.OnTenNSXChanging(value);
					this.SendPropertyChanging();
					this._TenNSX = value;
					this.SendPropertyChanged("TenNSX");
					this.OnTenNSXChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DiaChi", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string DiaChi
		{
			get
			{
				return this._DiaChi;
			}
			set
			{
				if ((this._DiaChi != value))
				{
					this.OnDiaChiChanging(value);
					this.SendPropertyChanging();
					this._DiaChi = value;
					this.SendPropertyChanged("DiaChi");
					this.OnDiaChiChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SoDT", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string SoDT
		{
			get
			{
				return this._SoDT;
			}
			set
			{
				if ((this._SoDT != value))
				{
					this.OnSoDTChanging(value);
					this.SendPropertyChanging();
					this._SoDT = value;
					this.SendPropertyChanged("SoDT");
					this.OnSoDTChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Mail", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string Mail
		{
			get
			{
				return this._Mail;
			}
			set
			{
				if ((this._Mail != value))
				{
					this.OnMailChanging(value);
					this.SendPropertyChanging();
					this._Mail = value;
					this.SendPropertyChanged("Mail");
					this.OnMailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tNhaSanXuat_tThuoc", Storage="_tThuocs", ThisKey="MaNSX", OtherKey="MaNSX")]
		public EntitySet<tThuoc> tThuocs
		{
			get
			{
				return this._tThuocs;
			}
			set
			{
				this._tThuocs.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_tThuocs(tThuoc entity)
		{
			this.SendPropertyChanging();
			entity.tNhaSanXuat = this;
		}
		
		private void detach_tThuocs(tThuoc entity)
		{
			this.SendPropertyChanging();
			entity.tNhaSanXuat = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tNhomThuoc")]
	public partial class tNhomThuoc : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _MaNhom;
		
		private string _TenNhom;
		
		private EntitySet<tThuoc> _tThuocs;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnMaNhomChanging(string value);
    partial void OnMaNhomChanged();
    partial void OnTenNhomChanging(string value);
    partial void OnTenNhomChanged();
    #endregion
		
		public tNhomThuoc()
		{
			this._tThuocs = new EntitySet<tThuoc>(new Action<tThuoc>(this.attach_tThuocs), new Action<tThuoc>(this.detach_tThuocs));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaNhom", DbType="NVarChar(200) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string MaNhom
		{
			get
			{
				return this._MaNhom;
			}
			set
			{
				if ((this._MaNhom != value))
				{
					this.OnMaNhomChanging(value);
					this.SendPropertyChanging();
					this._MaNhom = value;
					this.SendPropertyChanged("MaNhom");
					this.OnMaNhomChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TenNhom", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string TenNhom
		{
			get
			{
				return this._TenNhom;
			}
			set
			{
				if ((this._TenNhom != value))
				{
					this.OnTenNhomChanging(value);
					this.SendPropertyChanging();
					this._TenNhom = value;
					this.SendPropertyChanged("TenNhom");
					this.OnTenNhomChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tNhomThuoc_tThuoc", Storage="_tThuocs", ThisKey="MaNhom", OtherKey="MaNhom")]
		public EntitySet<tThuoc> tThuocs
		{
			get
			{
				return this._tThuocs;
			}
			set
			{
				this._tThuocs.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_tThuocs(tThuoc entity)
		{
			this.SendPropertyChanging();
			entity.tNhomThuoc = this;
		}
		
		private void detach_tThuocs(tThuoc entity)
		{
			this.SendPropertyChanging();
			entity.tNhomThuoc = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tThuoc")]
	public partial class tThuoc : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _MaThuoc;
		
		private string _TenThuoc;
		
		private string _NguonGoc;
		
		private string _SoLuong;
		
		private string _ThanhPhan;
		
		private string _CongDung;
		
		private string _CachDung;
		
		private string _ChuY;
		
		private System.DateTime _NgaySX;
		
		private string _HanSD;
		
		private string _BaoQuan;
		
		private string _DangBaoChe;
		
		private string _HamLuong;
		
		private string _MaNSX;
		
		private string _MaNhom;
		
		private EntityRef<tNhaSanXuat> _tNhaSanXuat;
		
		private EntityRef<tNhomThuoc> _tNhomThuoc;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnMaThuocChanging(string value);
    partial void OnMaThuocChanged();
    partial void OnTenThuocChanging(string value);
    partial void OnTenThuocChanged();
    partial void OnNguonGocChanging(string value);
    partial void OnNguonGocChanged();
    partial void OnSoLuongChanging(string value);
    partial void OnSoLuongChanged();
    partial void OnThanhPhanChanging(string value);
    partial void OnThanhPhanChanged();
    partial void OnCongDungChanging(string value);
    partial void OnCongDungChanged();
    partial void OnCachDungChanging(string value);
    partial void OnCachDungChanged();
    partial void OnChuYChanging(string value);
    partial void OnChuYChanged();
    partial void OnNgaySXChanging(System.DateTime value);
    partial void OnNgaySXChanged();
    partial void OnHanSDChanging(string value);
    partial void OnHanSDChanged();
    partial void OnBaoQuanChanging(string value);
    partial void OnBaoQuanChanged();
    partial void OnDangBaoCheChanging(string value);
    partial void OnDangBaoCheChanged();
    partial void OnHamLuongChanging(string value);
    partial void OnHamLuongChanged();
    partial void OnMaNSXChanging(string value);
    partial void OnMaNSXChanged();
    partial void OnMaNhomChanging(string value);
    partial void OnMaNhomChanged();
    #endregion
		
		public tThuoc()
		{
			this._tNhaSanXuat = default(EntityRef<tNhaSanXuat>);
			this._tNhomThuoc = default(EntityRef<tNhomThuoc>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaThuoc", DbType="NVarChar(200) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string MaThuoc
		{
			get
			{
				return this._MaThuoc;
			}
			set
			{
				if ((this._MaThuoc != value))
				{
					this.OnMaThuocChanging(value);
					this.SendPropertyChanging();
					this._MaThuoc = value;
					this.SendPropertyChanged("MaThuoc");
					this.OnMaThuocChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TenThuoc", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string TenThuoc
		{
			get
			{
				return this._TenThuoc;
			}
			set
			{
				if ((this._TenThuoc != value))
				{
					this.OnTenThuocChanging(value);
					this.SendPropertyChanging();
					this._TenThuoc = value;
					this.SendPropertyChanged("TenThuoc");
					this.OnTenThuocChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NguonGoc", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string NguonGoc
		{
			get
			{
				return this._NguonGoc;
			}
			set
			{
				if ((this._NguonGoc != value))
				{
					this.OnNguonGocChanging(value);
					this.SendPropertyChanging();
					this._NguonGoc = value;
					this.SendPropertyChanged("NguonGoc");
					this.OnNguonGocChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SoLuong", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string SoLuong
		{
			get
			{
				return this._SoLuong;
			}
			set
			{
				if ((this._SoLuong != value))
				{
					this.OnSoLuongChanging(value);
					this.SendPropertyChanging();
					this._SoLuong = value;
					this.SendPropertyChanged("SoLuong");
					this.OnSoLuongChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ThanhPhan", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string ThanhPhan
		{
			get
			{
				return this._ThanhPhan;
			}
			set
			{
				if ((this._ThanhPhan != value))
				{
					this.OnThanhPhanChanging(value);
					this.SendPropertyChanging();
					this._ThanhPhan = value;
					this.SendPropertyChanged("ThanhPhan");
					this.OnThanhPhanChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CongDung", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string CongDung
		{
			get
			{
				return this._CongDung;
			}
			set
			{
				if ((this._CongDung != value))
				{
					this.OnCongDungChanging(value);
					this.SendPropertyChanging();
					this._CongDung = value;
					this.SendPropertyChanged("CongDung");
					this.OnCongDungChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CachDung", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string CachDung
		{
			get
			{
				return this._CachDung;
			}
			set
			{
				if ((this._CachDung != value))
				{
					this.OnCachDungChanging(value);
					this.SendPropertyChanging();
					this._CachDung = value;
					this.SendPropertyChanged("CachDung");
					this.OnCachDungChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ChuY", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string ChuY
		{
			get
			{
				return this._ChuY;
			}
			set
			{
				if ((this._ChuY != value))
				{
					this.OnChuYChanging(value);
					this.SendPropertyChanging();
					this._ChuY = value;
					this.SendPropertyChanged("ChuY");
					this.OnChuYChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NgaySX", DbType="Date NOT NULL")]
		public System.DateTime NgaySX
		{
			get
			{
				return this._NgaySX;
			}
			set
			{
				if ((this._NgaySX != value))
				{
					this.OnNgaySXChanging(value);
					this.SendPropertyChanging();
					this._NgaySX = value;
					this.SendPropertyChanged("NgaySX");
					this.OnNgaySXChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HanSD", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string HanSD
		{
			get
			{
				return this._HanSD;
			}
			set
			{
				if ((this._HanSD != value))
				{
					this.OnHanSDChanging(value);
					this.SendPropertyChanging();
					this._HanSD = value;
					this.SendPropertyChanged("HanSD");
					this.OnHanSDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BaoQuan", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string BaoQuan
		{
			get
			{
				return this._BaoQuan;
			}
			set
			{
				if ((this._BaoQuan != value))
				{
					this.OnBaoQuanChanging(value);
					this.SendPropertyChanging();
					this._BaoQuan = value;
					this.SendPropertyChanged("BaoQuan");
					this.OnBaoQuanChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DangBaoChe", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string DangBaoChe
		{
			get
			{
				return this._DangBaoChe;
			}
			set
			{
				if ((this._DangBaoChe != value))
				{
					this.OnDangBaoCheChanging(value);
					this.SendPropertyChanging();
					this._DangBaoChe = value;
					this.SendPropertyChanged("DangBaoChe");
					this.OnDangBaoCheChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HamLuong", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string HamLuong
		{
			get
			{
				return this._HamLuong;
			}
			set
			{
				if ((this._HamLuong != value))
				{
					this.OnHamLuongChanging(value);
					this.SendPropertyChanging();
					this._HamLuong = value;
					this.SendPropertyChanged("HamLuong");
					this.OnHamLuongChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaNSX", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string MaNSX
		{
			get
			{
				return this._MaNSX;
			}
			set
			{
				if ((this._MaNSX != value))
				{
					if (this._tNhaSanXuat.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnMaNSXChanging(value);
					this.SendPropertyChanging();
					this._MaNSX = value;
					this.SendPropertyChanged("MaNSX");
					this.OnMaNSXChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaNhom", DbType="NVarChar(200) NOT NULL", CanBeNull=false)]
		public string MaNhom
		{
			get
			{
				return this._MaNhom;
			}
			set
			{
				if ((this._MaNhom != value))
				{
					if (this._tNhomThuoc.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnMaNhomChanging(value);
					this.SendPropertyChanging();
					this._MaNhom = value;
					this.SendPropertyChanged("MaNhom");
					this.OnMaNhomChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tNhaSanXuat_tThuoc", Storage="_tNhaSanXuat", ThisKey="MaNSX", OtherKey="MaNSX", IsForeignKey=true)]
		public tNhaSanXuat tNhaSanXuat
		{
			get
			{
				return this._tNhaSanXuat.Entity;
			}
			set
			{
				tNhaSanXuat previousValue = this._tNhaSanXuat.Entity;
				if (((previousValue != value) 
							|| (this._tNhaSanXuat.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._tNhaSanXuat.Entity = null;
						previousValue.tThuocs.Remove(this);
					}
					this._tNhaSanXuat.Entity = value;
					if ((value != null))
					{
						value.tThuocs.Add(this);
						this._MaNSX = value.MaNSX;
					}
					else
					{
						this._MaNSX = default(string);
					}
					this.SendPropertyChanged("tNhaSanXuat");
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tNhomThuoc_tThuoc", Storage="_tNhomThuoc", ThisKey="MaNhom", OtherKey="MaNhom", IsForeignKey=true)]
		public tNhomThuoc tNhomThuoc
		{
			get
			{
				return this._tNhomThuoc.Entity;
			}
			set
			{
				tNhomThuoc previousValue = this._tNhomThuoc.Entity;
				if (((previousValue != value) 
							|| (this._tNhomThuoc.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._tNhomThuoc.Entity = null;
						previousValue.tThuocs.Remove(this);
					}
					this._tNhomThuoc.Entity = value;
					if ((value != null))
					{
						value.tThuocs.Add(this);
						this._MaNhom = value.MaNhom;
					}
					else
					{
						this._MaNhom = default(string);
					}
					this.SendPropertyChanged("tNhomThuoc");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
