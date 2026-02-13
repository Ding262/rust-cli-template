use std::io::{self, Write};

fn main() {
    println!("╔════════════════════════════════════╗");
    println!("║     觉老师的喵喵 CLI v0.1.0     ║");
    println!("╚════════════════════════════════════╝");
    println!();
    
    let mut name = String::new();
    print!("请输入你的名字: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut name).unwrap();
    
    let name = name.trim();
    if name.is_empty() {
        name = "陌生人";
    }
    
    println!();
    println!("你好, {}!", name);
    println!();
    
    // 简单的问答
    println!("选择题:");
    println!("1. 今天星期几?");
    println!("2. 觉老师可爱吗?");
    println!("3. 退出");
    println!();
    
    loop {
        print!("请选择 (1-3): ");
        io::stdout().flush().unwrap();
        
        let mut choice = String::new();
        io::stdin().read_line(&mut choice).unwrap();
        
        match choice.trim() {
            "1" => {
                println!();
                println!("星期... 让我算算...");
                println!("答案是: 今天是喵喵日! (每天都是)");
            }
            "2" => {
                println!();
                println!("那必须的可爱 (得意)");
                println!("喵~");
            }
            "3" => {
                println!();
                println!("再见, {}!", name);
                println!("喵~");
                break;
            }
            _ => {
                println!();
                println!("无效选择，请重试");
            }
        }
        println!();
    }
}
