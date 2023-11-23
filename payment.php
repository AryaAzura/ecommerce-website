<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
   header('location:user_login.php');
};

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>checkout</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>

<?php include 'components/user_header.php'; ?>

<body>

<section class="checkout">
   <h2>checkout</h2>
   <form action="placeorder.php" method="post">

      <!-- Here you can put the rest of your checkout page form code -->

      <h3>place your orders</h3>

      <!-- Your other form elements here -->

      <h3>Payment Details</h3>
      <div class="flex">
         <div class="inputBox">
            <span>Card Number :</span>
            <input type="text" name="card_number" placeholder="enter card number" class="box" required>
         </div>
         <div class="inputBox">
            <span>Card Holder Name :</span>
            <input type="text" name="card_holder_name" placeholder="enter card holder name" class="box" required>
         </div>
         <div class="inputBox">
            <span>Expiry Date :</span>
            <input type="text" name="expiry_date" placeholder="enter expiry date" class="box" required>
         </div>
         <div class="inputBox">
            <span>CVV :</span>
            <input type="text" name="cvv" placeholder="enter cvv" class="box" required>
         </div>
      </div>

      <input type="submit" name="order" class="btn <?= ($grand_total > 1)?'':'disabled'; ?>" value="place order">

   </form>
</section>

<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>