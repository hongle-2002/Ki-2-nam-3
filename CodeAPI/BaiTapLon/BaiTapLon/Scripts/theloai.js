let url = 'https://localhost:44385/api';

$(document).ready(function () {
    GetListTheLoai();
});

function AnContent() {
    document.getElementById("content").style.display = 'none';
}

function HienContent() {
    document.getElementById("content").style.display = 'block';
}

//Lay tat ca nha san xuat
function GetListTheLoai() {
    $.ajax({
        url: url + "/theloai",
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            let table = '';
            for (var i = 0; i < data.length; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + data[i].MaTheLoai + '</td>';
                table = table + '<td>' + data[i].TenTheLoai + '</td>';

                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetTheLoai(\'' + data[i].MaTheLoai + '\')">Chi tiết</button> </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteTheLoai(\'' + data[i].MaTheLoai + '\')">Xóa</button> </td>';
                table = table + '</tr>';
            }
            document.getElementById('allTheLoai').innerHTML = table;
        }
    })
}

//Chi tiet
function GetTheLoai(MaTheLoai) {
    HienContent();
    $.ajax({
        url: url + "/theloai/" + MaTheLoai,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            $("#matheloai").val(data.MaTheLoai).prop('disabled', true);
            $("#matheloai").val(data.MaTheLoai),
                $("#tentheloai").val(data.TenTheLoai)
               
        }
    })
}

//checkinput
function CheckInput() {
    if ($("#matheloai").val() == "" || $("#tentheloai").val() == "" ) {
        return false;
    }
    return true;
}

//clear
function clearInput() {
    document.getElementById("matheloai").disabled = false;
    $("#matheloai").val(""),
        $("#tentheloai").val("")
       
}

//thêm nha san xuat
function AddTheLoai() {
    if (!CheckInput()) {
        alert("Hãy nhập đầy đủ thông tin!");
        return;
    }
    var code = $("#matheloai").val();
    // Kiểm tra xem mã nsx đã tồn tại hay chưa
    $.ajax({
        url: url + "/theloai/" + code,
        method: "GET",
        contentType: 'application/json',
        dataType: 'json',
        success: function (res) {
            if (res != null) {
                alert("Mã the loai đã tồn tại!");
                return;
            }

            // Thêm nsx mới
            $.ajax({
                url: url + "/theloai",
                method: "POST",
                data: JSON.stringify({
                    "MaTheLoai": code,
                    "TenTheLoai": $("#tentheloai").val()
                    
                }),
                contentType: 'application/json',
                dataType: 'json',
                error: function (res) {
                    alert("Thêm mới không thành công!");
                },
                success: function (res) {
                    alert("Thêm mới thành công!");
                    GetListTheLoai();
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
function EditTheLoai() {
    var code = $("#matheloai").val();

    // Kiểm tra xem mã thuốc có tồn tại trong dữ liệu hay không
    $.ajax({
        url: url + "/theloai/" + code,
        method: "GET",
        dataType: 'json',
        success: function (data) {
            // Nếu không tìm thấy thuốc với mã đã nhập, hiển thị thông báo cảnh báo
            if (!data) {
                alert("Mã the loai không tồn tại!");
                return;
            }

            // Tiếp tục thực hiện yêu cầu sửa thông tin thuốc
            if (!CheckInput()) {
                alert("Hãy nhập đầy đủ thông tin!");
                return;
            }
            if (confirm("Bạn có chắc muốn sửa?")) {
                $.ajax({
                    url: url + "/theloai",
                    method: "PUT",
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({
                        "MaTheLoai": $("#matheloai").val() == "" ? "NULL" : $("#matheloai").val(),
                        "TenTheLoai": $("#tentheloai").val() == "" ? "NULL" : $("#tentheloai").val()
                        
                    }),
                    error: function (data) {
                        alert("Sửa không thành công!");
                    },
                    success: function (data) {
                        alert("Sửa thành công!");
                        GetListTheLoai();
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
function DeleteTheLoai(MaTheLoai) {
    if (confirm("Bạn có chắc muốn xóa?")) {
        $.ajax({
            url: url + "/theloai/" + MaTheLoai,
            method: 'DELETE',
            contentType: 'application/json',
            dataType: 'json',
            error: function () {
                alert("Xóa The Loai với ID: " + MaTheLoai + "không thành công!");
            },
            success: function () {
                alert("Xóa The Loai với ID: " + MaTheLoai + " thành công!");
                GetListTheLoai();

                // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                clearInput();
            }
        })
    }
}

//tìm kiếm nhà sản xuất
function searchTheLoai() {
    var tenntl = $("#timkiem").val();
    var loai = $("#chonloai").val() == "--Chọn Loại--" ? "tenntl" : $("#chonloai").val();
    console.log(url + "/theloai?" + loai + "=" + tenntl);
    if (tenntl == "") {
        return;
    }
    $.ajax({
        url: url + "/theloai?" + loai + "=" + tenntl,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            if (data.length <= 0) {
                alert("Không có the loai cần tìm !")
                $("#timkiem").val("");
                $("#timkiem").focus();
                return;

            }
            let table = '';
            for (var i = 0; i < data.length; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + data[i].MaTheLoai + '</td>';
                table = table + '<td>' + data[i].TenTheLoai + '</td>';

                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetTheLoai(\'' + data[i].MaTheLoai + '\')">Chi tiết</button> </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteTheLoai(\'' + data[i].MaTheLoai + '\')">Xóa</button> </td>';
                table = table + '</tr>';
            }
            document.getElementById('allTheLoai').innerHTML = table;
        },
        error: function (data) {
            alert("Lỗi khi tìm kiếm!");
        }
    });
}