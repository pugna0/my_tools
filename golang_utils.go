timeout := make(chan bool, 1)
go func() {
    time.Sleep(1e9) // one second
    timeout <- true
    }()
    select {
        case <-ch:
        // a read from ch has occurred
        case <-timeout:
        // read from ch has timed out
    }
}

func Worker(in, out chan *Task) {
    for {
        t := <-in
        process(t)
        out <- t
    }
}
