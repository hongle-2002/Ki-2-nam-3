
$(document).ready(function () {
    GetAllSach();
    GetListTheLoai();
    GetListNXB();

});

function AnContent() {
    document.getElementById("content").style.display = 'none';
}

function HienContent() {
    document.getElementById("content").style.display = 'block';
}

function GetAllSach() {

    $.ajax({
        url: 'https://localhost:44385/api/sach/',
        method: 'GET',
        contentType: 'json',
        dataType: 'json',
        error: function (response) {
        },
        success: function (reponse) {
            const len = reponse.length;
            console.log(reponse);
            let table = '';
            for (var i = 0; i < len; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + reponse[i].MaSach + '</td>';
                table = table + '<td>' + reponse[i].TenSach + '</td>';
                table = table + '<td>' + reponse[i].TacGia + '</td>';
                table = table + '<td>' + reponse[i].SoTrang + '</td>';
                table = table + '<td>' + reponse[i].SoLuong + '</td>';
                table = table + '<td>' + reponse[i].MaTheLoai + '</td>';
                table = table + '<td>' + reponse[i].MaNXB + '</td>';
                table = table + '<td>' + reponse[i].TrongLuong + '</td>';
               // table = table + '<td> <ul>  <button type="button" data-target="#myModal" onclick="EditSach(\'' + reponse[i].MaSach + '\')"><i class="fa fa-edit"></i > Sửa</button > <button type="button" onclick="DeleteSach(\'' + reponse[i].MaSach + '\')"><i class="fa fa-trash"></i>Xóa</button> </ul > </td > ';
                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetSach(\'' + reponse[i].MaSach + '\')"><i class="fa fa-edit"></i > Chi Tiết</button > </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteSach(\'' + reponse[i].MaSach + '\')"><i class="fa fa-trash"></i>Xóa</button>   </td>';
               // table = table + '<td> <ul>  <button type="button" onclick="EditSach(\'' + reponse[i].MaSach + '\')"><i class="fa fa-edit"></i > Sửa</button > <button type="button" onclick="DeleteSach(\'' + reponse[i].MaSach + '\')"><i class="fa fa-trash"></i>Xóa</button> </ul > </td > ';

                table = table + '</tr>';
            }
            document.getElementById('allSach').innerHTML = table;
        },
        fail: function (response) {
        }
    });
}

//Lay list the loai
function GetListNXB() {
    $.ajax({
        url: url + "/Nhaxuatban",
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            let options = '';
            for (var i = 0; i < data.length; ++i) {
                options = options + '<option value="' + data[i].MaNXB + '">' + data[i].TenNXB + '</option>';
            }
            $('#manxb').html(options).prepend('<option value="" disabled selected hidden>--Chọn Nha xuat ban--</option>');
        }
    })
}

//lấy thông tin từ bảng nha xuat ban
function GetListTheLoai() {
    $.ajax({
        url: url + "/TheLoai",
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            let options = '';
            for (var i = 0; i < data.length; ++i) {
                options = options + '<option value="' + data[i].MaTheLoai + '">' + data[i].TenTheLoai + '</option>';
            }
            $('#matheloai').html(options).prepend('<option value="" disabled selected hidden>--Chọn Tên the loai--</option>');
        }
    })
}

//Chi tiết
function GetSach(id) {
    HienContent();
    $.ajax({
        url: url + "/sach/" + id,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            $("#id").val(data.MaSach).prop('disabled', true);
            $("#id").val(data.MaSach),
                $("#tensach").val(data.TenSach),
                $("#tacgia").val(data.TacGia),
                $("#sotrang").val(data.SoTrang),
                $("#soluong").val(data.SoLuong),
                $("#matheloai").val(data.MaTheLoai),
                $("#manxb").val(data.MaNXB),
                $("#trongluong").val(data.TrongLuong)
        }

    })
}

//Test
function AddSach1() {
    var code = $("#id").val();
    var urls = 'https://localhost:44385/api/sach?id=' +
        code + '&tensach=' + $("#tensach").val() +
        '&tacgia=' + $("#tacgia").val() + '&sotrang=' +
        $("#sotrang").val() + '&soluong=' + $("#soluong").val() + '&matheloai=' + $("#matheloai").val() + '&manxb=' + $("#manxb").val() + '&trongluong=' + $("#trongluong").val()
        + '&soluong=' + $("#soluong").val() + '&congdung=' + $("#congdung").val() + '&cachdung=' + $("#cachdung").val() + '&chuy=' + $("#chuy").val() + '&baoquan=' + $("#baoquan").val();
    console.log(urls);
    // Kiểm tra xem mã thuốc đã tồn tại hay chưa
    $.ajax({
        url: url + "/sach/" + code,
        method: "GET",
        contentType: 'application/json',
        dataType: 'json',
        success: function (res) {
            if (res != null) {
                alert("Mã sach đã tồn tại!");
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
                    GetAllSach();
                    // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                    clearInput();
                }
            });
        },
        error: function (res) {
            alert("Có lỗi xảy ra khi kiểm tra mã Sach!");
        }
    });
}

//Hàm lấy Thêm mới sách. Dùng $.ajax() thực hiện method HTTP POST

/*function insertSach() {
    if (!CheckInput()) {
        alert("Hãy nhập đầy đủ thông tin!");
        return;
    }
    var code = $("#id").val();
    // Kiểm tra xem mã thuốc đã tồn tại hay chưa
    $.ajax({
        url: url + "/sach/" + code,
        method: "GET",
        contentType: 'application/json',
        dataType: 'json',
        success: function (res) {
            if (res != null) {
                alert("Mã sach đã tồn tại!");
                return;
            }

            // Thêm sách mới
            $.ajax({
                url: url + "/sach",
                method: "POST",
                data: JSON.stringify({
                    "MaSach": code,
                    "TenSach": $("#tensach").val(),
                    "TacGia": $("#tacgia").val(),
                    "SoTrang": $("#sotrang").val(),
                    "SoLuong": $("#soluong").val(),
                    "MaTheLoai": $("#matheloai").val(),
                    "MaNXB": $("#manxb").val(),
                    "TrongLuong": $("#trongluong").val()

                }),
                contentType: 'application/json',
                dataType: 'json',
                error: function (res) {
                    alert("Thêm mới không thành công!");
                },
                success: function (res) {
                    alert("Thêm mới thành công!");
                    GetAllCustomers();
                    // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                    clearInput();
                }
            });
        },
        error: function (res) {
            alert("Có lỗi xảy ra khi kiểm tra mã sach!");
        }
    });
}*/

//thêm nha san xuat
function insertSach() {
    if (!CheckInput()) {
        alert("Hãy nhập đầy đủ thông tin!");
        return;
    }
    var code = $("#id").val();
    // Kiểm tra xem mã nsx đã tồn tại hay chưa
    $.ajax({
        url: url + "/sach/" + code,
        method: "GET",
        contentType: 'application/json',
        dataType: 'json',
        success: function (res) {
            if (res != null) {
                alert("Mã sach đã tồn tại!");
                return;
            }

            $.ajax({
                url: url + "/sach",
                method: "POST",
                data: JSON.stringify({
                    "MaSach": code,
                    "TenSach": $("#tensach").val(),
                    "TacGia": $("#tacgia").val(),
                    "SoTrang": $("#sotrang").val(),
                    "SoLuong": $("#soluong").val(),
                    "MaTheLoai": $("#matheloai").val(),
                    "MaNXB": $("#manxb").val(),
                    "TrongLuong": $("#trongluong").val()

                }),
                contentType: 'application/json',
                dataType: 'json',
                error: function (res) {
                    alert("Thêm mới không thành công!");
                },
                success: function (res) {
                    alert("Thêm mới thành công!");
                    GetListNXB();
                    // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                    clearInput();
                }
            });
        },
        error: function (res) {
            alert("Có lỗi xảy ra khi kiểm tra mã ma sach!");
        }
    });
}
//checkinput
function CheckInput() {
    if ($("#id").val() == "" || $("#tensach").val() == "" || $("#tacgia").val() == "" || $("#sotrang").val() == "" || $("#soluong").val() == "" || $("#matheloai").val() == "" ||
        $("#manxb").val() == "" || $("#trongluong").val() == "") {
        return false;
    }
    return true;
}
let url = 'https://localhost:44385/api';
function EditSach() {
    var code = $("#id").val();

    // Kiểm tra xem mã sách có tồn tại trong dữ liệu hay không
    $.ajax({
        url: url + "/sach/" + code,
        method: "GET",
        dataType: 'json',
        success: function (data) {
            // Nếu không tìm thấy sách với mã đã nhập, hiển thị thông báo cảnh báo
            if (!data) {
                alert("Mã sách không tồn tại!");
                return;
            }

            // Tiếp tục thực hiện yêu cầu sửa thông tin sách
             if (!CheckInput()) {
                 alert("Hãy nhập đầy đủ thông tin!");
                 return;
             }
            if (confirm("Bạn có chắc muốn sửa?")) {
                $.ajax({
                    url: url + "/sach",

                    method: "PUT",
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({
                        "MaSach": $("#id").val() == "" ? "NULL" : $("#id").val(),
                        "TenSach": $("#tensach").val() == "" ? "NULL" : $("#tensach").val(),
                        "TacGia": $("#tacgia").val() == "" ? "NULL" : $("#tacgia").val(),
                        "SoTrang": $("#sotrang").val() == "" ? "NULL" : $("#sotrang").val(),
                        "SoLuong": $("#soluong").val() == "" ? "NULL" : $("#soluong").val(),
                        "MaTheLoai": $("#matheloai").val() == "" ? "NULL" : $("#matheloai").val(),
                        "MaNXB": $("#manxb").val() == "" ? "NULL" : $("#manxb").val(),
                        "TrongLuong": $("#trongluong").val() == "" ? "NULL" : $("#trongluong").val()

                    }),
                    error: function (data) {
                        alert("Sửa không thành công!");
                    },
                    success: function (data) {
                        alert("Sửa thành công!");
                        GetAllSach();
                        // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                        clearInput();
                    }
                });
            }
        },
        error: function (data) {
            alert("Lỗi khi tìm kiếm mã sách!");
        }
    });
}


function clearInput() {
    document.getElementById("id").disabled = false;
    $("#id").val("");
    $("#tensach").val("");
    $("#tacgia").val("");
    $("#sotrang").val("");
    $("#soluong").val("");
    $("#matheloai").val("");
    $("#manxb").val("");
    $("#trongluong").val("");
}



function DeleteSach(MaSach) {
    if (confirm("Bạn có chắc muốn xóa?")) {
        $.ajax({
            url: url + "/sach/" + MaSach,
            method: 'DELETE',
            contentType: 'json',
            dataType: 'json',
            error: function () {
                alert("Xóa Sach với ID: " + MaSach + "không thành công!");
            },
            success: function () {
                alert("Xóa thuốc với ID: " + MaSach + " thành công!");
                GetAllSach();
                // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                clearInput();
            }
        })
    }
}

//tìm kiếm sach
function searchSach() {
    var tensach = $("#timkiem").val();
    var loai = $("#chonloai").val() == "--Chọn Loại--" ? "tensach" : $("#chonloai").val();
    console.log(url + "/sach?" + loai + "=" + tensach);
    if (tensach == "") {
        return;
    }
    $.ajax({
        url: url + "/sach?" + loai + "=" + tensach,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            if (data.length <= 0) {
                alert("Không có sach cần tìm !")
                $("#timkiem").val("");
                $("#timkiem").focus();
                return;

            }
            let table = '';
            for (var i = 0; i < data.length; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + data[i].MaSach + '</td>';
                table = table + '<td>' + data[i].TenSach + '</td>';
                table = table + '<td>' + data[i].TacGia + '</td>';
                table = table + '<td>' + data[i].SoTrang + '</td>';
                table = table + '<td>' + data[i].SoLuong + '</td>';
                table = table + '<td>' + data[i].MaTheLoai + '</td>';
                table = table + '<td>' + data[i].MaNXB + '</td>';
                table = table + '<td>' + data[i].TrongLuong + '</td>';
                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetSach(\'' + data[i].MaSach + '\')"><i class="fa fa-edit"></i > Chi Tiết</button > </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteSach(\'' + data[i].MaSach + '\')"><i class="fa fa-trash"></i>Xóa</button>   </td>';
               table = table + '</tr>';
            }
            document.getElementById('allSach').innerHTML = table;
        },
        error: function (data) {
            alert("Lỗi khi tìm kiếm!");
        }
    });
}