let url = 'https://localhost:44333/api';

$(document).ready(function () {
    GetListNSX();
});

function AnContent() {
    document.getElementById("content").style.display = 'none';
}

function HienContent() {
    document.getElementById("content").style.display = 'block';
}

//Lay tat ca nha san xuat
function GetListNSX() {
    $.ajax({
        url: url + "/nhasanxuats",
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            let table = '';
            for (var i = 0; i < data.length; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + data[i].MaNSX + '</td>';
                table = table + '<td>' + data[i].TenNSX + '</td>';
                table = table + '<td>' + data[i].DiaChi + '</td>';
                table = table + '<td>' + data[i].SoDT + '</td>';
                table = table + '<td>' + data[i].Mail + '</td>';
                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetNSX(\'' + data[i].MaNSX + '\')">Chi tiết</button> </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteNSX(\'' + data[i].MaNSX + '\')">Xóa</button> </td>';
                table = table + '</tr>';
            }
            document.getElementById('allNhaSX').innerHTML = table;
        }
    })
}

//Chi tiet
function GetNSX(MaNSX) {
    HienContent();
    $.ajax({
        url: url + "/nhasanxuats/" + MaNSX,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            $("#manhasanxuat").val(data.MaNSX).prop('disabled', true);
            $("#manhasanxuat").val(data.MaNSX),
                $("#tennhasanxuat").val(data.TenNSX),
                $("#diachi").val(data.DiaChi),
                $("#sodienthoai").val(data.SoDT),
                $("#mail").val(data.Mail)
        }
    })
}

//checkinput
function CheckInput() {
    if ($("#manhasanxuat").val() == "" || $("#tennhasanxuat").val() == "" || $("#diachi").val() == "" || $("#sodienthoai").val() == "" || $("#mail").val() == "") {
        return false;
    }
    return true;
}

//clear
function clearInput() {
    document.getElementById("manhasanxuat").disabled = false;
    $("#manhasanxuat").val(""),
        $("#tennhasanxuat").val(""),
        $("#diachi").val(""),
        $("#sodienthoai").val(""),
        $("#mail").val(""),
        $("#timkiem").val("")
}

//thêm nha san xuat
function AddNSX() {
    if (!CheckInput()) {
        alert("Hãy nhập đầy đủ thông tin!");
        return;
    }
    var code = $("#manhasanxuat").val();
    // Kiểm tra xem mã nsx đã tồn tại hay chưa
    $.ajax({
        url: url + "/nhasanxuats/" + code,
        method: "GET",
        contentType: 'application/json',
        dataType: 'json',
        success: function (res) {
            if (res != null) {
                alert("Mã nha san xuat đã tồn tại!");
                return;
            }

            // Thêm nsx mới
            $.ajax({
                url: url + "/nhasanxuats",
                method: "POST",
                data: JSON.stringify({
                    "MaNSX": code,
                    "TenNSX": $("#tennhasanxuat").val(),
                    "DiaChi": $("#diachi").val(),
                    "SoDT": $("#sodienthoai").val(),
                    "Mail": $("#mail").val()                   
                }),
                contentType: 'application/json',
                dataType: 'json',
                error: function (res) {
                    alert("Thêm mới không thành công!");
                },
                success: function (res) {
                    alert("Thêm mới thành công!");
                    GetListNSX();
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

//sửa thông tin nsx
function EditNSX() {
    var code = $("#manhasanxuat").val();

    // Kiểm tra xem mã thuốc có tồn tại trong dữ liệu hay không
    $.ajax({
        url: url + "/nhasanxuats/" + code,
        method: "GET",
        dataType: 'json',
        success: function (data) {
            // Nếu không tìm thấy thuốc với mã đã nhập, hiển thị thông báo cảnh báo
            if (!data) {
                alert("Mã nsx không tồn tại!");
                return;
            }

            // Tiếp tục thực hiện yêu cầu sửa thông tin thuốc
            if (!CheckInput()) {
                alert("Hãy nhập đầy đủ thông tin!");
                return;
            }
            if (confirm("Bạn có chắc muốn sửa?")) {
                $.ajax({
                    url: url + "/nhasanxuats",
                    method: "PUT",
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({
                        "MaNSX": $("#manhasanxuat").val() == "" ? "NULL" : $("#manhasanxuat").val(),
                        "TenNSX": $("#tennhasanxuat").val() == "" ? "NULL" : $("#tennhasanxuat").val(),
                        "DiaChi": $("#diachi").val() == "" ? "NULL" : $("#diachi").val(),
                        "SoDT": $("#sodienthoai").val() == "" ? "NULL" : $("#sodienthoai").val(),
                        "Mail": $("#mail").val() == "" ? "NULL" : $("#mail").val()
                    }),
                    error: function (data) {
                        alert("Sửa không thành công!");
                    },
                    success: function (data) {
                        alert("Sửa thành công!");
                        GetListNSX();
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
function DeleteNSX(MaThuoc) {
    if (confirm("Bạn có chắc muốn xóa?")) {
        $.ajax({
            url: url + "/nhasanxuats/" + MaThuoc,
            method: 'DELETE',
            contentType: 'application/json',
            dataType: 'json',
            error: function () {
                alert("Xóa NSX với ID: " + MaThuoc + "không thành công!");
            },
            success: function () {
                alert("Xóa NSX với ID: " + MaThuoc + " thành công!");
                GetListNSX();
                // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                clearInput();
            }
        })
    }
}

//tìm kiếm nhà sản xuất
function searchNSX() {
    var tennsx = $("#timkiem").val();
    var loai = $("#chonloai").val() == "--Chọn Loại--" ? "tennsx" : $("#chonloai").val();
    console.log(url + "/nhasanxuats?" + loai + "=" + tennsx);
    if (tennsx == "") {
        return;
    }
    $.ajax({
        url: url + "/nhasanxuats?" + loai + "=" + tennsx,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            if (data.length <= 0) {
                alert("Không có NSX cần tìm !")
                $("#timkiem").val("");
                $("#timkiem").focus();
                return;

            }
            let table = '';
            for (var i = 0; i < data.length; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + data[i].MaNSX + '</td>';
                table = table + '<td>' + data[i].TenNSX + '</td>';
                table = table + '<td>' + data[i].DiaChi + '</td>';
                table = table + '<td>' + data[i].SoDT + '</td>';
                table = table + '<td>' + data[i].Mail + '</td>';
                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetNSX(\'' + data[i].MaNSX + '\')">Chi tiết</button> </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteNSX(\'' + data[i].MaNSX + '\')">Xóa</button> </td>';
                table = table + '</tr>';
            }
            document.getElementById('allNhaSX').innerHTML = table;
        },
        error: function (data) {
            alert("Lỗi khi tìm kiếm!");
        }
    });
}