$(function(){
        var hasSelected = function(data){
        
        var x1 = data.x;
        var y1 = data.y;
        
        var x2 = data.x2;
        var y2 = data.y2;

        $(':text[name="start_x"]').val(x1);
        $(':text[name="start_y"]').val(y1);
        $(':text[name="end_x"]').val(x2);
        $(':text[name="end_y"]').val(y2);

        console.log('選択領域は(' + x1 + ',' + y1 + ')から(' + x2 + ',' + y2 + ') までです。')};
        
        var hasChanged = function(){
        };

        var hasReleased = function(){
        };

        $('#target').Jcrop({
              onSelect: hasSelected,
              onChange: hasChanged,
              onRelease: hasReleased
              });

});
$("#categolize").click(function(){
        alert("画像を１件登録しました。");
        });
$("#report").click(function(){
        alert("ご協力ありがとうございます。");
        });

