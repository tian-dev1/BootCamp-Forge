public class SinglyLinkedList {
    public Node head;
    
    public SinglyLinkedList() {
        this.head = null;
    }
    
    public void add(int value) {
        Node newNode = new Node(value);
        if(head == null) {
            head = newNode;
        } else {
            Node runner = head;
            while(runner.next != null) {
                runner = runner.next;
            }
            runner.next = newNode;
        }
    } 
    
    public void remove(){
        if(this.head != null){
            Node pointer = this.head;
            while(pointer.next.next != null){
                pointer = pointer.next;
            }
            pointer.next = null;
        }
    }
    
    public void printValues() {
    	if(this.head != null){
            Node pointer = this.head;
            while(pointer.next != null){
                System.out.println(pointer.value);
                pointer = pointer.next;
            }
        }
    }
    
    public Node find(int value){
        if(this.head != null){
            Node pointer = this.head;
            while(pointer.next != null){
                if(pointer.value == value){
                    return pointer;
                }
                pointer = pointer.next;
            }
        }
        return this.head;
    }
      
    public void removeAt(int index){
        if(this.head != null){
            int count = 0;
            Node pointer = this.head;
            Node temp = null;
            while(pointer.next != null){
                if(count == index){
                    temp.next = temp.next.next;
                    break;
                }
                temp = pointer;
                pointer = pointer.next;
                count++;
            }
        }
    }
}
