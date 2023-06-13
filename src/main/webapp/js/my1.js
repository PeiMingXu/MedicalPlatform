//点击发送按钮，设置倒计时，60s后才可以再次发送
function startTimer() {
    // 设置倒计时时间为60秒
    var countdown = 60;
    // 禁用发送按钮
    document.getElementById("sendBtn").disabled = true;
    // 显示倒计时
    var timer = document.getElementById("timer");
    timer.innerHTML = countdown + "秒重新发送";
    // 每隔一秒更新倒计时时间
    var interval = setInterval(function() {
        countdown--;
        timer.innerHTML = countdown + "秒重新发送";
        // 如果倒计时结束，则启用发送按钮并清除定时器
        if (countdown == 0) {
            clearInterval(interval);
            timer.innerHTML = "";
            document.getElementById("sendBtn").disabled = false;
        }
    }, 1000);
}
//全选按钮
$(document).ready(function() {
    $('#selectAll').click(function() {
        $('.selectSingle').prop('checked', $(this).prop('checked'));
    });
    $('.selectSingle').click(function() {
        if ($(this).prop('checked') == false) {
            $('#selectAll').prop('checked', false);
        }
        if ($('.selectSingle:checked').length == $('.selectSingle').length) {
            $('#selectAll').prop('checked', true);
        }
    });


    $('#sendBtn123').click(function() {
        var phones = [];
        $('.selectSingle:checked').each(function() {
            var phone = $(this).parent().siblings('[data-phone]').data('phone');
            phones.push(phone);
        });
        console.log(phones); // 可以在控制台输出选中的手机号码
        // 在这里将选中的手机号码传递给后台
    });
});



