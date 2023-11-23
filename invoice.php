<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};
?>

<?php

   $select_order = $conn->prepare("SELECT * FROM `orders` WHERE id = ?");
   $select_order->execute([$id]);
   $fetch_order = $select_order->fetch(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>invoice</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/style.css">
</head>
<body>

<?php include 'components/user_header.php'; ?>

<section class="invoice">

   <h1 class="heading">invoice</h1>

   <div class="box">
      <p>order id : <span><?= $fetch_order['id']; ?></span></p>
      <p>placed on : <span><?= $fetch_order['placed_on']; ?></span></p>
      <p>name : <span><?= $fetch_order['name']; ?></span></p>
      <p>email : <span><?= $fetch_order['email']; ?></span></p>
      <p>number : <span><?= $fetch_order['number']; ?></span></p>
      <p>address : <span><?= $fetch_order['address']; ?></span></p>
      <p>payment method : <span><?= $fetch_order['method']; ?></span></p>
      <p>payment status : <span><?= $fetch_order['status']; ?></span></p>
   </div>

   <table>
      <thead>
         <tr>
            <th>item</th>
            <th>price</th>
            <th>quantity</th>
            <th>total</th>
         </tr>
      </thead>
      <tbody>
         <?php
            $select_order_items = $conn->prepare("SELECT * FROM `order_items` WHERE order_id = ?");
            $select_order_items->execute([$id]);

            while ($fetch_order_items = $select_order_items->fetch(PDO::FETCH_ASSOC)) {
         ?>
            <tr>
               <td><?= $fetch_order_items['item']; ?></td>
               <td><?= $fetch_order_items['price']; ?></td>
               <td><?= $fetch_order_items['quantity']; ?></td>
               <td><?= $fetch_order_items['total']; ?></td>
            </tr>
         <?php } ?>
      </tbody>
   </table>

   <div class="total">
      <p>total : <span><?= $fetch_order['total']; ?></span></p>
   </div>

</section>

</body>
</html>