let addressSearchButton = document.getElementById('addressSearchButton');

addressSearchButton.addEventListener('click', function () {
  new daum.Postcode({
    oncomplete: function (data) {
      document.getElementById('inputAddress').value = data.sido;
      document.getElementById('inputAddress2').value = data.sigungu;
    }
  }).open();
});