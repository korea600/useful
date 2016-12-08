

//test2.js

process.on('exit',function(){
	   //exit이벤트 발생시 실행
	console.log('이벤트 발생!!');
});


process.on('jaehyun', function(msg) {
	console.log('재현 이벤트 발생: '+ msg);
});

console.log('2초 후 시스템 종료!!');
setTimeout(function() {
	 process.emit('jaehyun','어디야?');
	 process.exit();
}, 2000);//2초 후에 function()실행

var Calc = require('./calc3');

var calc = new Calc();
  calc.emit('stop');

console.log(Calc.title + "에 stop이벤트 전달!!" );  

console.log('======================');


var fs = require('fs');

//파일 읽기

var data = fs.readFileSync("./readme.md", 'UTF-8');
 console.log('데이터 : '+data);
 
  console.log('=======================');
  
  fs.readFile('./a.txt', function(err,data){
	  //비동기적으로 읽기 //현재 function은 a.txt파일을 전체 읽고 난 후에 실행
	  console.log('비동기 출력: '+data);
  });

  console.log('END');
  
  console.log('======================');
  //파일 쓰기
  fs.writeFile("./junghoon.txt", "식사는 하셨어요?", function(err) {
  	 if(err){
  		 console.log('에러발생: '+ err);
  	 }
  	 console.log('파일쓰기 완료!!');
  });










