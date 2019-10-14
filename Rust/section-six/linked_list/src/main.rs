#[derive(Debug)]
struct Node<T> {
    next: ?,
    value: T
}

impl<T> Node<T> {
    fn set_next(&mut self, ?) {
        self.next = ?;
    }
}

fn main() {
    let mut head = Node {
        next: ?,
        value: 1
    };
    
    let next = Node {
        next: ?,
        value: 2
    };
    
    head.set_next(next);
    
    println!("{:?}", head);
}
