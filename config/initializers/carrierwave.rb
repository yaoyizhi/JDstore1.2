CarrierWave.configure do |config|
    config.storage = :qiniu
    config.qiniu_access_key    = ENV['jqwIb52HuLYjr8SyN91YmQ3hPH-60t5JB2CaqhS5']
    config.qiniu_secret_key    = ENV['J7vus-v5mODJLD_BSyHBtDuSzcEN3QQ50N9MuftY']
    config.qiniu_bucket        = ENV['jdstore-demo']
    config.qiniu_bucket_domain = ENV["
  om45b7pwl.bkt.clouddn.com"]
    config.qiniu_block_size    = 4 * 1024 * 1024
    config.qiniu_protocol      = 'http'
    config.qiniu_up_host       = 'http://up.qiniug.com' # 选择不同的区域时，"up.qiniug.com" 不同
end
