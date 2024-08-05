let url = 'https://localhost:44385/api';

$(document).ready(function () {
    GetListNXB();
});

function AnContent() {
    document.getElementById("content").style.display = 'none';
}

function HienContent() {
    document.getElementById("content").style.display = 'block';
}

//Lay tat ca nha san xuat
function GetListNXB() {
    $.ajax({
        url: url + "/nhaxuatban",
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            let table = '';
            for (var i = 0; i < data.length; ++i) {
                table = table + '<tr>';
                table = table + '<td>' + data[i].MaNXB + '</td>';
                table = table + '<td>' + data[i].TenNXB + '</td>';

                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetNXB(\'' + data[i].MaNXB + '\')">Chi tiết</button> </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteNXB(\'' + data[i].MaNXB + '\')">Xóa</button> </td>';
                table = table + '</tr>';
            }
            document.getElementById('allNXB').innerHTML = table;
        }
    })
}

//Chi tiet
function GetNXB(MaNXB) {
    HienContent();
    $.ajax({
        url: url + "/nhaxuatban/" + MaNXB,
        method: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function (data) {
            $("#manxb").val(data.MaNXB).prop('disabled', true);
            $("#manxb").val(data.MaNXB),
                $("#tennxb").val(data.TenNXB)

        }
    })
}

//checkinput
function CheckInput() {
    if ($("#manxb").val() == "" || $("#tennxb").val() == "") {
        return false;
    }
    return true;
}

//clear
function clearInput() {
    document.getElementById("manxb").disabled = false;
    $("#manxb").val(""),
        $("#tennxb").val("")

}

//thêm nha san xuat
function AddNXB() {
    if (!CheckInput()) {
        alert("Hãy nhập đầy đủ thông tin!");
        return;
    }
    var code = $("#manxb").val();
    // Kiểm tra xem mã nsx đã tồn tại hay chưa
    $.ajax({
        url: url + "/nhaxuatban/" + code,
        method: "GET",
        contentType: 'application/json',
        dataType: 'json',
        success: function (res) {
            if (res != null) {
                alert("Mã nxb đã tồn tại!");
                return;
            }

            // Thêm nsx mới
            $.ajax({
                url: url + "/nhaxuatban",
                method: "POST",
                data: JSON.stringify({
                    "MaNXB": code,
                    "TenNXB": $("#tennxb").val()

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
            alert("Có lỗi xảy ra khi kiểm tra nxbc!");
        }
    });
}

//sửa thông tin nsx
function EditNXB() {
    var code = $("#manxb").val();

    // Kiểm tra xem mã thuốc có tồn tại trong dữ liệu hay không
    $.ajax({
        url: url + "/nhaxuatban/" + code,
        method: "GET",
        dataType: 'json',
        success: function (data) {
            // Nếu không tìm thấy thuốc với mã đã nhập, hiển thị thông báo cảnh báo
            if (!data) {
                alert("Mã NXB không tồn tại!");
                return;
            }

            // Tiếp tục thực hiện yêu cầu sửa thông tin thuốc
            if (!CheckInput()) {
                alert("Hãy nhập đầy đủ thông tin!");
                return;
            }
            if (confirm("Bạn có chắc muốn sửa?")) {
                $.ajax({
                    url: url + "/nhaxuatban",
                    method: "PUT",
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({
                        "MaNXB": $("#manxb").val() == "" ? "NULL" : $("#manxb").val(),
                        "TenNXB": $("#tennxb").val() == "" ? "NULL" : $("#tennxb").val()

                    }),
                    error: function (data) {
                        alert("Sửa không thành công!");
                    },
                    success: function (data) {
                        alert("Sửa thành công!");
                        GetListNXB();
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
function DeleteNXB(MaNXB) {
    if (confirm("Bạn có chắc muốn xóa?")) {
        $.ajax({
            url: url + "/nhaxuatban/" + MaNXB,
            method: 'DELETE',
            contentType: 'application/json',
            dataType: 'json',
            error: function () {
                alert("Xóa NXB với ID: " + MaNXB + "không thành công!");
            },
            success: function () {
                alert("Xóa XNB với ID: " + MaNXB + " thành công!");
                GetListNXB();

                // xóa dữ liệu trên các ô vừa điền sau khi thêm mới thành công
                clearInput();
            }
        })
    }
}

//tìm kiếm nhà sản xuất
function searchNXB() {
    var tennxb = $("#timkiem").val();
    var loai = $("#chonloai").val() == "--Chọn Loại--" ? "tennxb" : $("#chonloai").val();
    console.log(url + "/nhaxuatban?" + loai + "=" + tennxb);
    if (tennxb == "") {
        return;
    }
    $.ajax({
        url: url + "/nhaxuatban?" + loai + "=" + tennxb,
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
                table = table + '<td>' + data[i].MaNXB + '</td>';
                table = table + '<td>' + data[i].TenNXB + '</td>';

                table = table + '<td> <button type="button" class="btn btn-success" onclick="GetNXB(\'' + data[i].MaNXB + '\')">Chi tiết</button> </td>';
                table = table + '<td> <button type="button" class="btn btn-danger" onclick="DeleteNXB(\'' + data[i].MaNXB + '\')">Xóa</button> </td>';
                table = table + '</tr>';
            }
            document.getElementById('allNXB').innerHTML = table;
        },
        error: function (data) {
            alert("Lỗi khi tìm kiếm!");
        }
    });
}