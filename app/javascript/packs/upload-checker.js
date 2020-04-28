document.addEventListener("turbolinks:load", function() {

var uploadFields = $(
    '#leather_leather_photos, #leather_shoes_photos, #leather_bags_photos, #leather_other_photos')

uploadFields.change(function() {
  var size = 0;
  var type = 0;
  const validImageType = ['image/jpeg'];

  jQuery.each(this.files, function(index, item) {
    if (item.size > 2000000) {
      size += 1
    };
    if (!validImageType.includes(item['type'])) {
        type += 1
    }
  });
  if (parseInt(this.files.length) > 10){
     alert("Можно загрузить не больше 10 файлов за раз");
     $(this).val('');
  }
  if (size > 0) {
      alert(size + " шт. > 2мб, так нельзя");
      $(this).val('');
  }
  if (type > 0) {
      alert(type + " шт. не формата JPEG");
      $(this).val('');
  }
});

});