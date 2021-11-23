class Oystercard
    attr_reader :balance, :entry_station, :journey_history, :journey

    BALANCE_LIMIT = 90
    MINIMUM_FARE = 1

    def initialize
        @balance = 0
        @entry_station
        @journey_history = []
        #@journey = {} => now created by Journey class

    end

    def top_up(amount)
        fail 'can not top up more than £#{BALANCE_LIMIT}' if amount + @balance > BALANCE_LIMIT
        @balance += amount
    end

    def in_journey?
       true unless @entry_station.nil?
    end

    def touch_in(station)
        fail 'Insufficient funds, minimum fare is £#{MINIMUM_FARE}' if @balance < MINIMUM_FARE
        @journey = Journey.new(station)
        # @entry_station = station
    end

    def touch_out(station)
        # change journey exit station
        # calculare fare
        # deduct fare
        # add the journey to journey history

        deduct(MINIMUM_FARE)
        @journey[@entry_station] = station
        @journey_history.push(@journey)
        #@entry_station = nil
    end

    private

    def deduct(amount)
        @balance -= amount
    end

end