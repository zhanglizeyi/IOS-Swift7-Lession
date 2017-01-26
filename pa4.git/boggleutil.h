// Kyle Barron-Kraus <kbarronk>

#ifndef BOGGLEUTIL_H
#define BOGGLEUTIL_H

#include <cctype>
#include <algorithm>
#include <map>
#include <memory>
#include <string>
#include <utility>


/**
 * Class that represents a position on the Boggle Board.
 *
 * Each position contains its sanitized string that represents the
 * characters on that board position, as well as a boolean that
 * marks the board position as visited by a given search algorithm.
 */
class BoardPos {
  public:
    /**
     * Constructs a BoardPos with the given text. Text must have been
     * sanitized by the caller.
     */
    BoardPos(const std::string &text);

    /**
     * Returns the characters on this BoardPos.
     */
    const std::string &getText() const;
    
    /**
     * Returns whether this BoardPos has been visited or not.
     */
    bool getVisited() const;

    /**
     * Sets whether this BoardPos has been visited or not.
     */
    void setVisited(bool visited);

  private:
    /**
     * The characters that this BoardPos contains.
     */
    const std::string text;

    /**
     * Whether this BoardPos has been visited or not.
     */
    bool visited;
};



/**
 * Implement class for Trie
 */


#endif // BOGGLEUTIL_H
