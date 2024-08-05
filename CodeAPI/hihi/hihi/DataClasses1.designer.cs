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

namespace hihi
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
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="qls")]
	public partial class DataClasses1DataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InserttNXB(tNXB instance);
    partial void UpdatetNXB(tNXB instance);
    partial void DeletetNXB(tNXB instance);
    partial void InserttSach(tSach instance);
    partial void UpdatetSach(tSach instance);
    partial void DeletetSach(tSach instance);
    partial void InserttTheLoai(tTheLoai instance);
    partial void UpdatetTheLoai(tTheLoai instance);
    partial void DeletetTheLoai(tTheLoai instance);
    #endregion
		
		public DataClasses1DataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["qlsConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<tNXB> tNXBs
		{
			get
			{
				return this.GetTable<tNXB>();
			}
		}
		
		public System.Data.Linq.Table<tSach> tSaches
		{
			get
			{
				return this.GetTable<tSach>();
			}
		}
		
		public System.Data.Linq.Table<tTheLoai> tTheLoais
		{
			get
			{
				return this.GetTable<tTheLoai>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tNXB")]
	public partial class tNXB : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _MaNXB;
		
		private string _TenNXB;
		
		private EntitySet<tSach> _tSaches;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnMaNXBChanging(string value);
    partial void OnMaNXBChanged();
    partial void OnTenNXBChanging(string value);
    partial void OnTenNXBChanged();
    #endregion
		
		public tNXB()
		{
			this._tSaches = new EntitySet<tSach>(new Action<tSach>(this.attach_tSaches), new Action<tSach>(this.detach_tSaches));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaNXB", DbType="NVarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string MaNXB
		{
			get
			{
				return this._MaNXB;
			}
			set
			{
				if ((this._MaNXB != value))
				{
					this.OnMaNXBChanging(value);
					this.SendPropertyChanging();
					this._MaNXB = value;
					this.SendPropertyChanged("MaNXB");
					this.OnMaNXBChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TenNXB", DbType="NVarChar(50)")]
		public string TenNXB
		{
			get
			{
				return this._TenNXB;
			}
			set
			{
				if ((this._TenNXB != value))
				{
					this.OnTenNXBChanging(value);
					this.SendPropertyChanging();
					this._TenNXB = value;
					this.SendPropertyChanged("TenNXB");
					this.OnTenNXBChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tNXB_tSach", Storage="_tSaches", ThisKey="MaNXB", OtherKey="MaNXB")]
		public EntitySet<tSach> tSaches
		{
			get
			{
				return this._tSaches;
			}
			set
			{
				this._tSaches.Assign(value);
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
		
		private void attach_tSaches(tSach entity)
		{
			this.SendPropertyChanging();
			entity.tNXB = this;
		}
		
		private void detach_tSaches(tSach entity)
		{
			this.SendPropertyChanging();
			entity.tNXB = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tSach")]
	public partial class tSach : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _MaSach;
		
		private string _TenSach;
		
		private string _TacGia;
		
		private System.Nullable<int> _SoTrang;
		
		private System.Nullable<int> _SoLuong;
		
		private string _MaTheLoai;
		
		private string _MaNXB;
		
		private string _TrongLuong;
		
		private EntityRef<tNXB> _tNXB;
		
		private EntityRef<tTheLoai> _tTheLoai;
        internal string tensach;

        #region Extensibility Method Definitions
        partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnMaSachChanging(string value);
    partial void OnMaSachChanged();
    partial void OnTenSachChanging(string value);
    partial void OnTenSachChanged();
    partial void OnTacGiaChanging(string value);
    partial void OnTacGiaChanged();
    partial void OnSoTrangChanging(System.Nullable<int> value);
    partial void OnSoTrangChanged();
    partial void OnSoLuongChanging(System.Nullable<int> value);
    partial void OnSoLuongChanged();
    partial void OnMaTheLoaiChanging(string value);
    partial void OnMaTheLoaiChanged();
    partial void OnMaNXBChanging(string value);
    partial void OnMaNXBChanged();
    partial void OnTrongLuongChanging(string value);
    partial void OnTrongLuongChanged();
    #endregion
		
		public tSach()
		{
			this._tNXB = default(EntityRef<tNXB>);
			this._tTheLoai = default(EntityRef<tTheLoai>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaSach", DbType="NVarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string MaSach
		{
			get
			{
				return this._MaSach;
			}
			set
			{
				if ((this._MaSach != value))
				{
					this.OnMaSachChanging(value);
					this.SendPropertyChanging();
					this._MaSach = value;
					this.SendPropertyChanged("MaSach");
					this.OnMaSachChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TenSach", DbType="NVarChar(100)")]
		public string TenSach
		{
			get
			{
				return this._TenSach;
			}
			set
			{
				if ((this._TenSach != value))
				{
					this.OnTenSachChanging(value);
					this.SendPropertyChanging();
					this._TenSach = value;
					this.SendPropertyChanged("TenSach");
					this.OnTenSachChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TacGia", DbType="NVarChar(50)")]
		public string TacGia
		{
			get
			{
				return this._TacGia;
			}
			set
			{
				if ((this._TacGia != value))
				{
					this.OnTacGiaChanging(value);
					this.SendPropertyChanging();
					this._TacGia = value;
					this.SendPropertyChanged("TacGia");
					this.OnTacGiaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SoTrang", DbType="Int")]
		public System.Nullable<int> SoTrang
		{
			get
			{
				return this._SoTrang;
			}
			set
			{
				if ((this._SoTrang != value))
				{
					this.OnSoTrangChanging(value);
					this.SendPropertyChanging();
					this._SoTrang = value;
					this.SendPropertyChanged("SoTrang");
					this.OnSoTrangChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SoLuong", DbType="Int")]
		public System.Nullable<int> SoLuong
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
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaTheLoai", DbType="NVarChar(50)")]
		public string MaTheLoai
		{
			get
			{
				return this._MaTheLoai;
			}
			set
			{
				if ((this._MaTheLoai != value))
				{
					if (this._tTheLoai.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnMaTheLoaiChanging(value);
					this.SendPropertyChanging();
					this._MaTheLoai = value;
					this.SendPropertyChanged("MaTheLoai");
					this.OnMaTheLoaiChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaNXB", DbType="NVarChar(50)")]
		public string MaNXB
		{
			get
			{
				return this._MaNXB;
			}
			set
			{
				if ((this._MaNXB != value))
				{
					if (this._tNXB.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnMaNXBChanging(value);
					this.SendPropertyChanging();
					this._MaNXB = value;
					this.SendPropertyChanged("MaNXB");
					this.OnMaNXBChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TrongLuong", DbType="NVarChar(50)")]
		public string TrongLuong
		{
			get
			{
				return this._TrongLuong;
			}
			set
			{
				if ((this._TrongLuong != value))
				{
					this.OnTrongLuongChanging(value);
					this.SendPropertyChanging();
					this._TrongLuong = value;
					this.SendPropertyChanged("TrongLuong");
					this.OnTrongLuongChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tNXB_tSach", Storage="_tNXB", ThisKey="MaNXB", OtherKey="MaNXB", IsForeignKey=true)]
		public tNXB tNXB
		{
			get
			{
				return this._tNXB.Entity;
			}
			set
			{
				tNXB previousValue = this._tNXB.Entity;
				if (((previousValue != value) 
							|| (this._tNXB.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._tNXB.Entity = null;
						previousValue.tSaches.Remove(this);
					}
					this._tNXB.Entity = value;
					if ((value != null))
					{
						value.tSaches.Add(this);
						this._MaNXB = value.MaNXB;
					}
					else
					{
						this._MaNXB = default(string);
					}
					this.SendPropertyChanged("tNXB");
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tTheLoai_tSach", Storage="_tTheLoai", ThisKey="MaTheLoai", OtherKey="MaTheLoai", IsForeignKey=true)]
		public tTheLoai tTheLoai
		{
			get
			{
				return this._tTheLoai.Entity;
			}
			set
			{
				tTheLoai previousValue = this._tTheLoai.Entity;
				if (((previousValue != value) 
							|| (this._tTheLoai.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._tTheLoai.Entity = null;
						previousValue.tSaches.Remove(this);
					}
					this._tTheLoai.Entity = value;
					if ((value != null))
					{
						value.tSaches.Add(this);
						this._MaTheLoai = value.MaTheLoai;
					}
					else
					{
						this._MaTheLoai = default(string);
					}
					this.SendPropertyChanged("tTheLoai");
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
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tTheLoai")]
	public partial class tTheLoai : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _MaTheLoai;
		
		private string _TenTheLoai;
		
		private EntitySet<tSach> _tSaches;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnMaTheLoaiChanging(string value);
    partial void OnMaTheLoaiChanged();
    partial void OnTenTheLoaiChanging(string value);
    partial void OnTenTheLoaiChanged();
    #endregion
		
		public tTheLoai()
		{
			this._tSaches = new EntitySet<tSach>(new Action<tSach>(this.attach_tSaches), new Action<tSach>(this.detach_tSaches));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaTheLoai", DbType="NVarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string MaTheLoai
		{
			get
			{
				return this._MaTheLoai;
			}
			set
			{
				if ((this._MaTheLoai != value))
				{
					this.OnMaTheLoaiChanging(value);
					this.SendPropertyChanging();
					this._MaTheLoai = value;
					this.SendPropertyChanged("MaTheLoai");
					this.OnMaTheLoaiChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TenTheLoai", DbType="NVarChar(50)")]
		public string TenTheLoai
		{
			get
			{
				return this._TenTheLoai;
			}
			set
			{
				if ((this._TenTheLoai != value))
				{
					this.OnTenTheLoaiChanging(value);
					this.SendPropertyChanging();
					this._TenTheLoai = value;
					this.SendPropertyChanged("TenTheLoai");
					this.OnTenTheLoaiChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tTheLoai_tSach", Storage="_tSaches", ThisKey="MaTheLoai", OtherKey="MaTheLoai")]
		public EntitySet<tSach> tSaches
		{
			get
			{
				return this._tSaches;
			}
			set
			{
				this._tSaches.Assign(value);
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
		
		private void attach_tSaches(tSach entity)
		{
			this.SendPropertyChanging();
			entity.tTheLoai = this;
		}
		
		private void detach_tSaches(tSach entity)
		{
			this.SendPropertyChanging();
			entity.tTheLoai = null;
		}
	}
}
#pragma warning restore 1591
