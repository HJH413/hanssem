$(document).ready(function(){
    color_inversion();
    category_underline();
    category_block();
    
    
    

    // 헤더에 호버하면 색반전 되는 함수
    function color_inversion(){
        $('.header').mouseenter(function(){
                //헤더 색반전
                $(this).css({
                    background:'#000'
                })
                //로고 이미지 바꾸기
                $('.logo > img').attr('src', 'img/logo_white.png')
                //탑 네비 색반전
                $('.top_nav_ul').css({
                    color:'#fff'
                })
                //서치 아이콘 이미지 바꾸기
                $('#search_icon > svg').css({
                    fill:'#fff'
                })
                //바텀네비 색반전
                $('.bottom_nav_ul').css({
                    color:'#fff',
                    borderTop:'3px solid #fff',
                    borderBottom:'3px solid #fff'
                })
            })
        $('.header').mouseleave(function(){
                //헤더 색반전
                $(this).css({
                    background: 'inherit'   
                })
                //로고 이미지 바꾸기
                $('.logo > img').attr('src', 'img/logo_black.png')
                //탑 네비 색반전
                $('.top_nav_ul').css({
                    color:'#000'
                })
                //서치 아이콘 이미지 바꾸기
                $('#search_icon > svg').css({
                    fill:'#000'
                })
                //바텀네비 색반전
                $('.bottom_nav_ul').css({
                    color:'#000',
                    borderTop:'3px solid #000',
                    borderBottom:'3px solid #000'
                })
            })
        

    }

    //호버하면 밑줄 나오는 함수
    function category_underline(){
        $('.bottom_nav_ul>li').mouseenter(function(){
            $(this).css({
                textDecoration:'underline'
            })
        })
        $('.bottom_nav_ul>li').mouseleave(function(){
            $('.bottom_nav_ul>li').css({
                textDecoration:'none'
            })
        })
    }
    //호버하면 카테고리 나오는 함수 
    function category_blo3ck(){
        let c_length = $('.category_box').length;
        for(let i = 0 ; i < c_length ; i++){
            $('.bottom_nav_ul>li').eq(i).mouseenter(function(){
                $('.category_box').eq(i).css({
                    display:'flex'
                })

            }) 
            $('.category_box').eq(i).mouseleave(function(){
                $('.category_box').css({
                    display:'none'
                })
            }) 
        }    
    }
    //호버하면 카테고리 나오는 함수(fade)
    function category_bloc2k(){
        let c_length = $('.category_box').length;
        for(let i = 0 ; i < c_length ; i++){
            $('.bottom_nav_ul>li').eq(i).mouseenter(function(){
                $('.ca_group').eq(i).fadeIn(1000)
            }) 
            $('.category_box').eq(i).mouseleave(function(){
                $('.ca_group').fadeOut(1000)
            }) 
        }    
    }
    //호버하면 카테고리 나오는 함수(slide)
    function category_block() {
        let c_length = $('.category_box').length;
        for(let i = 0 ; i < c_length ; i++){
            $('.bottom_nav_ul>li').eq(i).mouseenter(function(){
                $('.category_box').eq(i).slideDown(1000)
            }) 
            $('.category_box').eq(i).mouseleave(function(){
                $('.category_box').slideUp(1000)
            }) 
        }  
    }






    let tri =$('.tri').eq(0).css({
        left:'230px'
    })
    let tri2 =$('.tri').eq(1).css({
        left:'500px'
    })
    let tri3 =$('.tri').eq(2).css({
        left:'785px'
    })
    let tri4 =$('.tri').eq(3).css({
        left:'1070px'
    })




})
