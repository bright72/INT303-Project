<%-- 
    Document   : cart
    Created on : Nov 2, 2018, 11:05:32 AM
    Author     : INT303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en th">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <!-- Title  -->
        <title>Farm LungRun | Cart</title>
        <!-- Favicon  -->
        <!-- <link rel="icon" href="img/core-img/favicon.ico"> -->
        <link rel="icon" href="img/LOGO.PNG">
        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
    </head>

    <body>
        <jsp:include page="include/nav.jsp?page=Cart"/>
        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="cart-title mt-50">
                            <h2>Shopping Cart</h2>
                        </div>
                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr style="text-align: center">
                                        <th></th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>                   
                                    </tr>
                                </thead>
                                <c:forEach items="${sessionScope.cart.lineItems}" var="p" varStatus="n">
                                    <tbody>
                                        <tr style="text-align: center">
                                            <td class="cart_product_img">
                                                <a href="#"><img src="img/${p.product.productcode}.png" alt="${p.product.productcode}"></a>
                                            </td>
                                            <td class="cart_product_desc">
                                                <h5>${p.product.productname}</h5>
                                            </td>
                                            <td class="cart_product_desc">
                                                <h5>${p.product.productprice} ฿</h5>
                                            </td>
                                            <td class="cart_product_desc" >   
                                                <div class="quantity">
                                                    <a class="qty-minus" href="MinusFromCart?productCode=${p.product.productcode}"><i class="fa fa-minus" aria-hidden="true"></i></a>
                                                    <span>${p.quantity}</span>
                                                    <a class="qty-plus" href="AddToCart?productCode=${p.product.productcode}&&quantity=1&&page=cart"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                                    <a href="RemoveFromCart?productcode=${p.product.productcode}">
                                                       <button type="button" class="close" >
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>      
                                                    </a>
                                                </div>
                                                <br>
                                            </td>                                                                         
                                        </tr>
                                    </tbody>
                                </c:forEach>                                
                            </table>
                            <div style="text-align: center">
                                <c:if test="${sessionScope.cart == null}">
                                    <h3 style="color: grey">${message}</h3>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>Cart Total</h5>
                            <ul class="summary-table">
                                <li><span>subtotal:</span> <span>${sessionScope.cart == null ? "0 " : " "}${cart.totalPrice}฿</span></li>
                                <li><span>delivery:</span> <span>Free</span></li>
                                <li><span>total:</span> <span>${sessionScope.cart == null ? "0 " : " "}${cart.totalPrice}฿</span></li>
                            </ul>             
                            <div class="cart-btn">
                                <c:if test="${cart==null}">
                                    <p style="color: red;">${message_checkout}</p>
                                    <a href="Checkout" class="btn amado-btn w-100">Checkout</a>
                                </c:if>
                                <c:if test="${cart!=null}">
                                    <a href="checkout.jsp" class="btn amado-btn w-100">Checkout</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="js/plugins.js"></script>
<!-- Active js -->
<script src="js/active.js"></script>
<jsp:include page="include/footer.jsp?page=Cart"/>
</html>  
