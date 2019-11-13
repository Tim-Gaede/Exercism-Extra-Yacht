module Yacht
    export YACHT, ONES, TWOS, THREES, FOURS, FIVES, SIXES,
           FULL_HOUSE, FOUR_OF_A_KIND, LITTLE_STRAIGHT,
           BIG_STRAIGHT, CHOICE, score

    # Score categories
    YACHT = 0
    ONES = 1
    TWOS = 2
    THREES = 3
    FOURS = 4
    FIVES = 5
    SIXES = 6
    FULL_HOUSE = 7
    FOUR_OF_A_KIND = 8
    LITTLE_STRAIGHT = 9
    BIG_STRAIGHT = 10
    CHOICE = 11

    function score(dice, category)

        if length(dice) != 5
            throw("Invalid number of dice.")
        end

        if category == YACHT
            if (dice[1] == dice[2] == dice[3] ==
                dice[4] == dice[5])
                return 50
            else
                return 0
            end
        end

        if category == CHOICE
            sum = 0
            for die in dice;    sum += die;    end
            return sum
        end

        if (category == ONES   ||  category == TWOS   ||
            category == THREES ||  category == FOURS  ||
            category == FIVES  ||  category == SIXES)

            sum = 0
            for die in dice
                if die == category;    sum += category;    end
            end
            return sum
        end


        sort!(dice) # Helpful for analyzing remaining categories

        if category == FULL_HOUSE
            if ( (dice[1] == dice[2]  &&
                  dice[2] != dice[3]  &&
                  dice[3] == dice[4] == dice[5])

                    ||

                 (dice[1] == dice[2] == dice[3]  &&
                  dice[3] != dice[4]  &&
                  dice[4] == dice[5]) )

                sum = 0
                for die in dice;    sum += die;    end
                return sum

            else
                return 0
            end
        end


        if category == FOUR_OF_A_KIND # At LEAST four
            if (dice[1] == dice[2] == dice[3] == dice[4]  ||
                dice[2] == dice[3] == dice[4] == dice[5])

                return 4*dice[2]

            else
                return 0
            end
        end

        if category == LITTLE_STRAIGHT
            if (dice[1] == 1  &&  dice[2] == 2  &&
                dice[3] == 3  &&  dice[4] == 4  &&
                dice[5] == 5)
                return 30
            else
                return 0
            end
        end

            ## Alternate code
            #valid = True
            #for i = 1:5
            #    valid *= dice[i] == i

            #if valid    return 30
            #else        return  0


            ## Another piece of alternate code
            #invalid_fnd = false
            #i = 0
            #while i <= 5  &&  !invalid_fnd
            #    if dice[i] != i    invalid_fnd = true
            #    i += 1

            #if invalid_fnd == false
            #    return 30
            #else
            #    return  0

        if category == BIG_STRAIGHT
            if (dice[1] == 2  &&  dice[2] == 3  &&
                dice[3] == 4  &&  dice[4] == 5  &&
                dice[5] == 6)
                return 30
            else
                return 0
            end
        end

        throw("Invalid category passed to score().")
    end

end
