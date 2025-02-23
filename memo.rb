require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

# ファイル書き込み関数
# 引数→入力されたファイル名
def fileWrite(inputCsvFilePath)
  arrayInputData = []

  inputCsvFilePath = 'Sample.csv' if inputCsvFilePath == '' #引数が空(新規作成)の場合、ファイル名をSample.csvにする

  # 値入力
  while true
    inputData = gets
    break if inputData.nil? #Ctrl＋Dが押されたらループを抜ける
    arrayInputData << inputData.chomp #入力値を出力用の配列に格納
  end

  # CSVファイルに書き込む
  CSV.open(inputCsvFilePath, 'w') do |csv|
    arrayInputData.each do |data|
      csv << [data]  # 各入力を新しい行として書き込む
    end
  end
end


# 入力したファイルの有無を判定する関数
# ファイルあり→true/なし→false
def fileSelect()
  p "ファイル名を入力してください(.csvは除く)"
  fileName = gets.chomp
  csvFilePath = "#{fileName}" + ".csv"

  if File.exist?(csvFilePath)
    p "メモを編集します"
    true
  else
    p "ファイルが存在しません"
    false
  end
end



# csvファイル名
csvFilePath = ''

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

# １か２が入力されるまで繰り返す
while true
  memoType = gets.to_i

  if memoType == 1
    p "メモしたい内容を入力してください"
    p "完了したらCtrl+Dを押してください"
    fileWrite(csvFilePath);
    break
  elsif memoType == 2
    if fileSelect() == true
      fileWrite(csvFilePath);
    end
    break
  else
    p "1か2を入力してください"
  end
end
