

// 引数受取り
let arg_option = process.argv[2];
let arg_month = process.argv[3];

let end_of_month = new Date();
end_of_month.setMonth(end_of_month.getMonth()+1, 0)
let date = new Date();
let month = date.getMonth() + 1;
let year = date.getFullYear();
const daysInJapanese = ["日", "月", "火", "水", "木", "金", "土"];

// 引数確認
if(arg_option == "-m" && arg_month != undefined){
  arg_month = parseInt(arg_month);
  if(arg_month > 12 || arg_month <= 0) {
    console.log(arg_month + " is neither a month number (1..12) nor a name");
    return;
  }
  let diff_of_arg_and_today = arg_month - month; 
  month = arg_month;
  end_of_month.setMonth(end_of_month.getMonth() + 1 + diff_of_arg_and_today, 0)
}

let day = new Date(year, month - 1, 1);

output_header();
output_cal(make_cal(day,end_of_month));


// カレンダー作成
function make_cal(day,end_of_month){
  // カレンダーの初期化
  let cal = new Array(6).fill(null).map(() => new Array(7).fill(null));

  // 第何週かを管理する
  let week_num = 0;
  for (let i = 1; i <= end_of_month.getDate(); i++) {
    cal[week_num][day.getDay()] = i; 
    if (day.getDay() === 6) week_num++;
    day.setDate(day.getDate() + 1);
  }
  return cal; 
}

// 引数の確認
function arg_month_checker(arg_month){
  if(arg_month > 12 || arg_month <= 0) {
    console.log(arg_month + " is neither a month number (1..12) nor a name");
    return;
  }
}

function output_header(){
  // ヘッダー部分
  console.log('        ' + month + "月  " + year);
  let header ='';
  daysInJapanese.forEach(element => {
    header += element + '  ';
  });
  console.log(header);
}

function output_cal(cal){
  // カレンダー本体
  for (let i = 0; i < 6; i++) {
    let row = '';
    for (let j = 0; j < 7; j++) {
      if (cal[i][j] != null) {
        // 1桁の日付の場合、前にスペースを追加
        row += (cal[i][j] < 10 ? ' ' : '') + cal[i][j] + '  ';
      } else {
        // nullの場合、スペースを追加して位置を揃える
        row += '    ';
      }
    }
    console.log(row);
  }  
}