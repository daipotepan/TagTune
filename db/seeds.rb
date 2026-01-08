%w[
  作業用
  チル
  元気
  夜
  勉強
  ドライブ
].each do |name|
  Tag.find_or_create_by!(name: name)
end
