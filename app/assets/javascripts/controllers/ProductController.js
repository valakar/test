angular.module('testApp').controller("ProductController", function($scope, $http){
  $scope.hi = "Hello world1"
  $http.get('/api/products/').success(function(data) {
    $scope.products = data.products;
  })
  $scope.submitForm = function() {
      if ($scope.editing) {
          console.log('EDIT');
          $scope.updateProduct();
      } else {
          console.log('NEW');
          $http.post('/api/products/', {product: $scope.newProduct}).success(function(data) {
              $scope.products.push(data.product);
              $scope.newProduct = {};
          })
      }
  };
  $scope.deleteCall = function(product) {
      $http.delete("/api/products/" + product.id)
          .success(function ()
          {
              console.log('Success');
              var index = $scope.products.indexOf(product);
              $scope.products.splice(index,1);
          })
          .error(function (data)
          {
              console.log('Error');
          });
  };

  $scope.editCall = function(product){
          $scope.enterNew = false;
          $scope.editing = true;
          $scope.newProduct = product;
  };

  $scope.updateProduct = function() {
     console.log('UPDATE');
     $http.put('/api/products/' + $scope.newProduct.id, {"product": $scope.newProduct})
        .success(function(data){
            $scope.product = data.product;
            $scope.newProduct = {};
        });
  };
});