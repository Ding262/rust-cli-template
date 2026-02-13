use std::io::{self, Write};

// 计算字符串的显示宽度（考虑 Unicode 字符）
fn display_width(s: &str) -> usize {
    s.chars().map(|c| {
        match c {
            '。' | '！' | '？' | '，' | '。' | '、' => 1,
            c if c.is_ascii() => 1,
            c if c.is_whitespace() => 1,
            _ => 2, // 中文字符等宽字符
        }
    }).sum()
}

fn main() {
    let title = "觉老师的喵喵 CLI v0.1.0";
    let width = 36;
    let title_width = display_width(title);
    let padding = (width - title_width) / 2;
    
    println!("╔{:═^width$}╗", "", width = width);
    println!("║{:^width$}║", title, width = width);
    println!("╚{:═^width$}╝", "", width = width);
    println!();
    
    let mut input_name = String::new();
    print!("请输入你的名字: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input_name).unwrap();
    
    let name = input_name.trim();
    if name.is_empty() {
        println!();
        println!("你好, 陌生人!");
    } else {
        println!();
        println!("你好, {}!", name);
    }
    println!();
    
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
                let goodbye = if name.is_empty() { "陌生人" } else { name };
                println!();
                println!("再见, {}!", goodbye);
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
