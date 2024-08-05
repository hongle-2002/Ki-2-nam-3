let url = 'https://localhost:44333/api';
$(document).ready(function () {
    GetListNhom();
    GetListNhaSX();
    GetListThuoc();
});

function AnContent() {
    document.getElementById("content").style.display = 'none';
}

function HienContent() {
    document.getElementById("content").style.display = 'block';
}

//Lay list Nhom Thuoc
function GetListNhom() {
    $.ajax({
        url: url + "/nhomthuocs",
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            let options = '';
            for (var i = 0; i < data.length; ++i) {
                options = options + '<option value="' + data[i].MaNhom + '">' + data[i].TenNhom + '</option>';
            }
            $('#nhomthuoclist').html(options).prepend('<option value="" disabled selected hidden>--Chọn Loại Thuốc--</option>');
        }
    })
}

//lấy thông tin từ bảng nhà sản xuất
function GetListNhaSX() {
    $.ajax({
        url: url + "/nhasanxuats",
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            let options = '';
            for (var i = 0; i < data.length; ++i) {
                options = options + '<option value="' + data[i].MaNSX + '">' + data[i].TenNSX + '</option>';
            }
            $('#nhasanxuat').html(options).prepend('<option value="" disabled selected hidden>--Chọn Tên NSX--</option>');
        }
    })
}

//lấy thông tin từ bảng sách
function GetListThuoc() {
    $.ajax({
        url: url + "/thuocs/",
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            let table = '';
            for (var i = 0; i < data.length; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + data[i].MaThuoc + '</td>';
                table = table + '<td>' + data[i].TenThuoc + '</td>';
                table = table + '<td>' + data[i].tNhomThuoc.TenNhom + '</td>';
                table = table + '<td>' + data[i].tNhaSanXuat.TenNSX + '</td>';
                table = table + '<td>' + data[i].NguonGoc + '</td>';
                table = table + '<td>' + data[i].DangBaoChe + '</td>';
                table = table + '<td>' + new Date(data[i].NgaySX).toISOString().split('T')[0] + '</td>';
                table = table + '<td>' + data[i].HanSD + '</td>';
                table = table + '<td>' + data[i].SoLuong + '</td>';
                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetThuoc(\'' + data[i].MaThuoc + '\')">Chi tiết</button> </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteThuoc(\'' + data[i].MaThuoc + '\')">Xóa</button> </td>';
                table = table + '</tr>';
            }
            document.getElementById('allThuoc').innerHTML = table;
        }
    })
}

//Test
function AddThuoc1() {
    var code = $("#mathuoc").val();
    var urls = 'https://localhost:44333/api/thuocs?id=' +
        code + '&tenthuoc=' + $("#tenthuoc").val() +
        '&nguonGoc=' + $("#nguongoc").val() + '&thanhPhan=' +
        $("#thanhphan").val() + '&maSX=' + $("#nhasanxuat").val() + '&maNhom=' + $("#nhomthuoclist").val() + '&hansd=' + $("#hansd").val() + '&ngaysx=' + $("#ngaysx").val()
        + '&soluong=' + $("#soluong").val() + '&congdung=' + $("#congdung").val() + '&cachdung=' + $("#cachdung").val() + '&chuy=' + $("#chuy").val() + '&baoquan=' + $("#baoquan").val()
        + '&dangbaoche=' + $("#dangbaoche").val() + '&hamluong=' + $("#hamluong").val();
    console.log(urls);
    // Kiểm tra xem mã thuốc đã tồn tại hay chưa
    $.ajax({
        url: url + "/thuocs/" + code,
        method: "GET",
        contentType: 'application/json',
        dataType: 'json',
        success: function (res) {
            if (res != null) {
                alert("Mã thuốc đã tồn tại!");
                return;
            }

            // Thêm thuốc mới
            $.ajax({
                url: urls,
                method: "POST",
                contentType: 'json',
                dataType: 'json',
                error: function (response) {
                    alert("Thêm mới không thành công");
                },

                success: function (res) {
                    alert("Thêm mới thành công!");
                    GetListThuoc();
                    // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                    clearInput();
                }
            });
        },
        error: function (res) {
            alert("Có lỗi xảy ra khi kiểm tra mã thuốc!");
        }
    });
}

//thêm thuốc
function AddThuoc() {
    if (!CheckInput()) {
        alert("Hãy nhập đầy đủ thông tin!");
        return;
    }
    var code = $("#mathuoc").val();
    // Kiểm tra xem mã thuốc đã tồn tại hay chưa
    $.ajax({
        url: url + "/thuocs/" + code,
        method: "GET",
        contentType: 'application/json',
        dataType: 'json',
        success: function (res)
        {
            if (res != null) {
                alert("Mã thuốc đã tồn tại!");
                return;
            }

            // Thêm sách mới
            $.ajax({
                url: url + "/thuocs",
                method: "POST",
                data: JSON.stringify({
                    "MaThuoc": code,
                    "TenThuoc": $("#tenthuoc").val(),
                    "NguonGoc": $("#nguongoc").val(),
                    "SoLuong": $("#soluong").val(),
                    "ThanhPhan": $("#thanhphan").val(),
                    "CongDung": $("#congdung").val(),
                    "CachDung": $("#cachdung").val(),
                    "ChuY": $("#chuy").val(),
                    "NgaySX": $("#ngaysx").val(),
                    "HanSD": $("#hansd").val(),
                    "BaoQuan": $("#baoquan").val(),
                    "DangBaoChe": $("#dangbaoche").val(),
                    "HamLuong": $("#hamluong").val(),
                    "MaNSX": $("#nhasanxuat").val(),
                    "MaNhom": $("#nhomthuoclist").val()
                }),
                contentType: 'application/json',
                dataType: 'json',
                error: function (res) {
                    alert("Thêm mới không thành công!");
                },
                success: function (res) {
                    alert("Thêm mới thành công!");
                    GetListThuoc();
                    // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                    clearInput();
                }
            });
        },
        error: function (res) {
            alert("Có lỗi xảy ra khi kiểm tra mã thuốc!");
        }
    });
}

//Chi tiết
function GetThuoc(MaThuoc) {
    HienContent();
    $.ajax({
        url: url + "/thuocs/" + MaThuoc,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
                $("#mathuoc").val(data.MaThuoc).prop('disabled', true);
                $("#mathuoc").val(data.MaThuoc),
                    $("#tenthuoc").val(data.TenThuoc),
                    $("#nhomthuoclist").val(data.tNhomThuoc.MaNhom),
                $("#nhasanxuat").val(data.tNhaSanXuat.MaNSX),
                $("#nguongoc").val(data.NguonGoc),
                $("#soluong").val(data.SoLuong),
                $("#dangbaoche").val(data.DangBaoChe),
                $("#ngaysx").val(new Date(data.NgaySX).toISOString().split('T')[0]),
                $("#hansd").val(data.HanSD),
                $("#baoquan").val(data.BaoQuan),
                $("#hamluong").val(data.HamLuong),
                $("#thanhphan").val(data.ThanhPhan),
                $("#congdung").val(data.CongDung),
                $("#cachdung").val(data.CachDung),
                $("#chuy").val(data.ChuY)


        }

    })
}

//checkinput
function CheckInput() {
    if ($("#mathuoc").val() == "" || $("#tenthuoc").val() == "" || $("#nguongoc").val() == "" || $("#soluong").val() == "" || $("#thanhphan").val() == "" || $("#congdung").val() == "" ||
        $("#cachdung").val() == "" || $("#chuy").val() == "" || $("#ngaysx").val() == "" || $("#hansd").val() == "" || $("#baoquan").val() == "" || $("#dangbaoche").val() == "" ||
        $("#hamluong").val() == "" || $("#nhasanxuat").val() == "" || $("#nhomthuoclist").val() == "") {
        return false;
    }
    return true;
}

//clear
function clearInput() {
    document.getElementById("mathuoc").disabled = false;
        $("#mathuoc").val(""),
        $("#tenthuoc").val(""),
        $("#nhomthuoclist").val(""),
        $("#nhasanxuat").val(""),
        $("#nguongoc").val(""),
        $("#soluong").val(""),
        $("#dangbaoche").val(""),
        $("#ngaysx").val(""),
        $("#hansd").val(""),
        $("#baoquan").val(""),
        $("#hamluong").val(""),
        $("#thanhphan").val(""),
        $("#congdung").val(""),
        $("#cachdung").val(""),
        $("#chuy").val(""),
        $("#timkiem").val("")
}

//sửa thông tin thuốc
function EditThuoc() {
    var code = $("#mathuoc").val();

    // Kiểm tra xem mã thuốc có tồn tại trong dữ liệu hay không
    $.ajax({
        url: url + "/thuocs/" + code,
        method: "GET",
        dataType: 'json',
        success: function (data) {
            // Nếu không tìm thấy thuốc với mã đã nhập, hiển thị thông báo cảnh báo
            if (!data) {
                alert("Mã thuốc không tồn tại!");
                return;
            }

            // Tiếp tục thực hiện yêu cầu sửa thông tin thuốc
            if (!CheckInput()) {
                alert("Hãy nhập đầy đủ thông tin!");
                return;
            }
            if (confirm("Bạn có chắc muốn sửa?")) {
                $.ajax({
                    url: url + "/thuocs",
                    method: "PUT",
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({
                        "MaThuoc": $("#mathuoc").val() == "" ? "NULL" : $("#mathuoc").val(),
                        "TenThuoc": $("#tenthuoc").val() == "" ? "NULL" : $("#tenthuoc").val(),
                        "NguonGoc": $("#nguongoc").val() == "" ? "NULL" : $("#nguongoc").val(),
                        "SoLuong": $("#soluong").val() == "" ? "NULL" : $("#soluong").val(),
                        "ThanhPhan": $("#thanhphan").val() == "" ? "NULL" : $("#thanhphan").val(),
                        "CongDung": $("#congdung").val() == "" ? "NULL" : $("#congdung").val(),
                        "CachDung": $("#cachdung").val() == "" ? "NULL" : $("#cachdung").val(),
                        "ChuY": $("#chuy").val() == "" ? "NULL" : $("#chuy").val(),
                        "NgaySX": $("#ngaysx").val() == "" ? "NULL" : $("#ngaysx").val(),
                        "HanSD": $("#hansd").val() == "" ? "NULL" : $("#hansd").val(),
                        "BaoQuan": $("#baoquan").val() == "" ? "NULL" : $("#baoquan").val(),
                        "DangBaoChe": $("#dangbaoche").val() == "" ? "NULL" : $("#dangbaoche").val(),
                        "HamLuong": $("#hamluong").val() == "" ? "NULL" : $("#hamluong").val(),
                        "MaNSX": $("#nhasanxuat").val() == "" ? "NULL" : $("#nhasanxuat").val(),
                        "MaNhom": $("#nhomthuoclist").val() == "" ? "NULL" : $("#nhomthuoclist").val()

                    }),
                    error: function (data) {
                        alert("Sửa không thành công!");
                    },
                    success: function (data) {
                        alert("Sửa thành công!");
                        GetListThuoc();
                        // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                        clearInput();
                    }
                });
            }
        },
        error: function (data) {
            alert("Lỗi khi tìm kiếm mã thuốc!");
        }
    });
}

//xóa Thuốc
function DeleteThuoc(MaThuoc) {
    if (confirm("Bạn có chắc muốn xóa?")) {
        $.ajax({
            url: url + "/thuocs/" + MaThuoc,
            method: 'DELETE',
            contentType: 'application/json',
            dataType: 'json',
            error: function () {
                alert("Xóa thuốc với ID: " + MaThuoc + "không thành công!");
            },
            success: function () {
                alert("Xóa thuốc với ID: " + MaThuoc + " thành công!");
                GetListThuoc();
                // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                clearInput();
            }
        })
    }
}

//tìm kiếm thuốc
function searchThuoc() {
    var tenthuoc = $("#timkiem").val();
    var loai = $("#chonloai").val() == "--Chọn Loại--" ? "tenthuoc" : $("#chonloai").val();
    console.log(url + "/thuocs?" + loai + "=" + tenthuoc);
    if (tenthuoc == "") {
        return;
    }
    $.ajax({
        url: url + "/thuocs?" + loai + "=" + tenthuoc,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            if (data.length <= 0) {
                alert("Không có thuốc cần tìm !")
                $("#timkiem").val("");
                $("#timkiem").focus();
                return;

            }
            let table = '';
            for (var i = 0; i < data.length; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + data[i].MaThuoc + '</td>';
                table = table + '<td>' + data[i].TenThuoc + '</td>';
                table = table + '<td>' + data[i].tNhomThuoc.TenNhom + '</td>';
                table = table + '<td>' + data[i].tNhaSanXuat.TenNSX + '</td>';
                table = table + '<td>' + data[i].NguonGoc + '</td>';
                table = table + '<td>' + data[i].DangBaoChe + '</td>';
                table = table + '<td>' + new Date(data[i].NgaySX).toISOString().split('T')[0] + '</td>';
                table = table + '<td>' + data[i].HanSD + '</td>';
                table = table + '<td>' + data[i].SoLuong + '</td>';
                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetThuoc(\'' + data[i].MaThuoc + '\')">Chi tiết</button> </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteThuoc(\'' + data[i].MaThuoc + '\')">Xóa</button> </td>';
                table = table + '</tr>';
            }
            document.getElementById('allThuoc').innerHTML = table;
        },
        error: function (data) {
            alert("Lỗi khi tìm kiếm!");
        }
    });
}

