package uk.co.ultravisual.fontrenderer.table;
interface ITable {
/**
	     * Get the table type, as a table directory value.
	     * @return The table type
	     */
    function getType():Int;

/**
	     * Get a directory entry for this table.  This uniquely identifies the
	     * table in collections where there may be more than one instance of a
	     * particular table.
	     * @return A directory entry
	     */
    function getDirectoryEntry():DirectoryEntry;
}
