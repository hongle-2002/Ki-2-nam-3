let url = 'https://localhost:44333/api';

$(document).ready(function () {
    GetListNhom();
});

function AnContent() {
    document.getElementById("content").style.display = 'none';
}

function HienContent() {
    document.getElementById("content").style.display = 'block';
}

//Lay tat ca nha san xuat
function GetListNhom() {
    $.ajax({
        url: url + "/nhomthuocs",
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            let table = '';
            for (var i = 0; i < data.length; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + data[i].MaNhom + '</td>';
                table = table + '<td>' + data[i].TenNhom + '</td>';
                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetNhom(\'' + data[i].MaNhom + '\')">Chi tiết</button> </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteNhom(\'' + data[i].MaNhom + '\')">Xóa</button> </td>';
                table = table + '</tr>';
            }
            document.getElementById('allNhom').innerHTML = table;
        }
    })
}

//Chi tiet
function GetNhom(MaNhom) {
    HienContent();
    $.ajax({
        url: url + "/nhomthuocs/" + MaNhom,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            $("#manhom").val(data.MaNhom).prop('disabled', true);
            $("#manhom").val(data.MaNhom),
            $("#tennhom").val(data.TenNhom)
        }
    })
}

//checkinput
function CheckInput() {
    if ($("#manhom").val() == "" || $("#tennhom").val() == "") {
        return false;
    }
    return true;
}

//clear
function clearInput() {
    document.getElementById("manhom").disabled = false;
    $("#manhom").val(""),
        $("#tennhom").val(""),
    $("#timkiem").val("")
}

//thêm nha san xuat
function AddNhom() {
    if (!CheckInput()) {
        alert("Hãy nhập đầy đủ thông tin!");
        return;
    }
    var code = $("#manhom").val();
    // Kiểm tra xem mã nsx đã tồn tại hay chưa
    $.ajax({
        url: url + "/nhomthuocs/" + code,
        method: "GET",
        contentType: 'application/json',
        dataType: 'json',
        success: function (res) {
            if (res != null) {
                alert("Mã nhóm đã tồn tại!");
                return;
            }

            // Thêm nsx mới
            $.ajax({
                url: url + "/nhomthuocs",
                method: "POST",
                data: JSON.stringify({
                    "MaNhom": code,
                    "TenNhom": $("#tennhom").val()             
                }),
                contentType: 'application/json',
                dataType: 'json',
                error: function (res) {
                    alert("Thêm mới không thành công!");
                },
                success: function (res) {
                    alert("Thêm mới thành công!");
                    GetListNhom();
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
function EditNhom() {
    var code = $("#manhom").val();

    // Kiểm tra xem mã nhóm có tồn tại trong dữ liệu hay không
    $.ajax({
        url: url + "/nhomthuocs/" + code,
        method: "GET",
        dataType: 'json',
        success: function (data) {
            // Nếu không tìm thấy nhóm với mã đã nhập, hiển thị thông báo cảnh báo
            if (!data) {
                alert("Mã nhóm không tồn tại!");
                return;
            }

            // Tiếp tục thực hiện yêu cầu sửa thông tin thuốc
            if (!CheckInput()) {
                alert("Hãy nhập đầy đủ thông tin!");
                return;
            }
            if (confirm("Bạn có chắc muốn sửa?")) {
                $.ajax({
                    url: url + "/nhomthuocs",
                    method: "PUT",
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({
                        "MaNhom": $("#manhom").val() == "" ? "NULL" : $("#manhom").val(),
                        "TenNhom": $("#tennhom").val() == "" ? "NULL" : $("#tennhom").val()
                    }),
                    error: function (data) {
                        alert("Sửa không thành công!");
                    },
                    success: function (data) {
                        alert("Sửa thành công!");
                        GetListNhom();
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
function DeleteNhom(MaThuoc) {
    if (confirm("Bạn có chắc muốn xóa?")) {
        $.ajax({
            url: url + "/nhomthuocs/" + MaThuoc,
            method: 'DELETE',
            contentType: 'application/json',
            dataType: 'json',
            error: function () {
                alert("Xóa nhóm với ID: " + MaThuoc + "không thành công!");
            },
            success: function () {
                alert("Xóa nhóm với ID: " + MaThuoc + " thành công!");
                GetListNhom();
                // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                clearInput();
            }
        })
    }
}

//tìm kiếm nhà sản xuất
function searchNhom() {
    var tennhom = $("#timkiem").val();
    var loai = $("#chonloai").val() == "--Chọn Loại--" ? "tennhoms" : $("#chonloai").val();
    console.log(url + "/nhomthuocs?" + loai + "=" + tennhom);
    if (tennhom == "") {
        return;
    }
    $.ajax({
        url: url + "/nhomthuocs?" + loai + "=" + tennhom,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            if (data.length <= 0) {
                alert("Không có nhóm cần tìm !")
                $("#timkiem").val("");
                $("#timkiem").focus();
                return;

            }
            let table = '';
            for (var i = 0; i < data.length; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + data[i].MaNhom + '</td>';
                table = table + '<td>' + data[i].TenNhom + '</td>';
                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetNhom(\'' + data[i].MaNhom + '\')">Chi tiết</button> </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteNhom(\'' + data[i].MaNhom + '\')">Xóa</button> </td>';
                table = table + '</tr>';
            }
            document.getElementById('allNhom').innerHTML = table;
        },
        error: function (data) {
            alert("Lỗi khi tìm kiếm!");
        }
    });
}