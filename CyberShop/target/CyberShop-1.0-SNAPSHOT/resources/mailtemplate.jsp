
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#dcf0f8" style="margin:0;padding:0;background-color:#f2f2f2;width:100%!important;font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#444;line-height:18px">
            <tbody>
                <tr>
                    <td align="center" valign="top" style="font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#444;line-height:18px;font-weight:normal">

                        <table border="0" cellpadding="0" cellspacing="0" width="600" style="margin-top:15px">
                            <tbody>
                                <tr style="background:#fff">
                                    <td align="left" width="600" height="auto" style="padding:15px">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <p style="font-size: 20px;">Chào quý khách,<span style="color: red">${fullname}</span></p>
                                                        <p>Cybershop gửi đến quý khách hóa đơn điện tử cho đơn hàng ${orderID}</p>

                                                        <h3 style="font-size:13px;font-weight:bold;color:#02acea;text-transform:uppercase;margin:20px 0 0 0;border-bottom:1px solid #ddd">Thông tin đơn hàng #${orderID}
                                                            <span style="font-size:12px;color:#777;text-transform:none;font-weight:normal">(${orderDate})</span>
                                                        </h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#444;line-height:18px">

                                                        <p align="left" width="50%" style="padding:6px 9px 0px 9px;font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#444;font-weight:bold">Thông tin thanh toán</p>
                                                        <p valign="top" style="padding:3px 9px 9px 9px;border-top:0;font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#444;line-height:18px;font-weight:normal">

                                                            <span style="text-transform:capitalize">${fullname}</span>
                                                            <br>  <a>${email}</a>
                                                            <br>  ${phone}

                                                        </p>


                                                        <p align="left" width="50%" style="padding:6px 9px 0px 9px;font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#444;font-weight:bold">Địa chỉ giao hàng</p>
                                                        <p valign="top" style="padding:3px 9px 9px 9px;border-top:0;border-left:0;font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#444;line-height:18px;font-weight:normal">
                                                            ${address}
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h2 style="text-align:left;margin:10px 0;border-bottom:1px solid #ddd;padding-bottom:5px;font-size:13px;color:#02acea">CHI TIẾT ĐƠN HÀNG</h2>
                                                    </td></tr>
                                        </table>
                                        <table cellspacing="0" cellpadding="0" border="0" width="100%" style="background:#f5f5f5">
                                            <thead>
                                                <tr>
                                                    <th align="left" bgcolor="#02acea" style="padding:6px 9px;color:#fff;text-transform:uppercase;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:14px">Sản phẩm</th>
                                                    <th align="left" bgcolor="#02acea" style="padding:6px 9px;color:#fff;text-transform:uppercase;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:14px"> Đơn giá</th>
                                                    <th align="left" bgcolor="#02acea" style="padding:6px 9px;color:#fff;text-transform:uppercase;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:14px">Số lượng</th>
                                                    <th align="left" bgcolor="#02acea" style="padding:6px 9px;color:#fff;text-transform:uppercase;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:14px">Giảm giá</th>
                                                    <th align="right" bgcolor="#02acea" style="padding:6px 9px;color:#fff;text-transform:uppercase;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:14px">Tổng tạm</th>
                                                </tr>
                                            </thead>

                                            <tbody bgcolor="#eee" style="font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#444;line-height:18px">
                                                <c:forEach items="">
                                                <tr>
                                                    <td align="left" valign="top" style="padding:3px 9px">
                                                        <strong>Pin Sạc Dự Phòng Xiaomi Gen 2S Version 2018 10000 mAh 2 Cổng USB Hỗ Trợ QC 3.0 - PLM09ZM - Đen - Hàng Chính Hãng</strong>
                                                    </td>

                                                    <td align="left" valign="top" style="padding:3px 9px"><span class="m_-8916674270506943549price">299.000,00&nbsp;₫</span></td>
                                                    <td align="left" valign="top" style="padding:3px 9px">1</td>
                                                    <td align="left" valign="top" style="padding:3px 9px"><span class="m_-8916674270506943549price">0,00&nbsp;₫</span></td>
                                                    <td align="right" valign="top" style="padding:3px 9px">
                                                        <span class="m_-8916674270506943549price">299.000,00&nbsp;₫</span>                

                                                    </td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>

                            <tfoot style="font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#444;line-height:18px">
                                <tr>
                                    <td colspan="4" align="right" style="padding:5px 9px">Giảm giá Phiếu Quà Tặng</td>
                                    <td align="right" style="padding:5px 9px"><span class="m_-8916674270506943549price">0,00&nbsp;₫</span></td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="right" style="padding:5px 9px">Chi phí vận chuyển</td>
                                    <td align="right" style="padding:5px 9px"><span class="m_-8916674270506943549price">29.000,00&nbsp;₫</span></td>
                                </tr>
                                <tr bgcolor="#eee">
                                    <td colspan="4" align="right" style="padding:7px 9px"><strong><big>Tổng giá trị đơn hàng</big></strong></td>
                                    <td align="right" style="padding:7px 9px"><strong><big><span class="m_-8916674270506943549price">${total}&nbsp;₫</span></big></strong></td>
                                </tr>
                            </tfoot>

                        </table>
                        <br/>
                        <p style="font-family:Arial,Helvetica,sans-serif;font-size:20px;margin:0;padding:0;line-height:18px;color:#444;font-weight:bold;color:red">Cybershop cảm ơn quý khách</p>
                        <p style="font-family:Arial,Helvetica,sans-serif;font-size:13px;line-height:18px;color:#4b8da5;padding:10px 0;margin:0px;font-weight:normal" align="left ">Quý khách nhận được email này vì đã mua hàng tại Cybershop.<p/>
            </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>
</body>
</html>
