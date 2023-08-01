import { Box, Checkbox, FormControlLabel } from '@mui/material';

const StyledTable = ({ columns, data, selectedItems, setSelectedItems, handleSelect, page, rowsPerPage }) => {
    return (
        <Box sx={{ width: '100%', margin: 'auto', padding: '20px' }}>
            <Box sx={{ overflow: 'auto' }}>
                <table className="table table-striped table-bordered table-hover" style={{ minWidth: "100%" }}>
                    <thead>
                        <tr>
                            {columns.map((column) => (
                                <th key={column.field} style={{ width: column.width }}>
                                    {column.field === "checkbox" ? (
                                        <FormControlLabel
                                            sx={{ alignContent: 'center' }}
                                            control={<Checkbox />}
                                            label=""
                                            checked={selectedItems.length === data.length}
                                            indeterminate={selectedItems.length > 0 && selectedItems.length < data.length}
                                            onChange={(event) => {
                                                const checked = event.target.checked;
                                                setData((prevData) => prevData.map(item => ({ ...item, selected: checked })));
                                                setSelectedItems(checked ? data.map(item => item.id) : []);
                                            }}
                                        />
                                    ) : (
                                        column.headerName
                                    )}
                                </th>
                            ))}
                        </tr>
                    </thead>
                    <tbody>
                        {data
                            .slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
                            .map((row) => (
                                <tr key={row.id} style={{ backgroundColor: "white" }}>
                                    {columns.map((column) => (
                                        <td
                                            key={`${row.id}-${column.field}`}
                                            style={{ backgroundColor: "white" }}
                                        >
                                            {column.field === "checkbox" ? (
                                                <Checkbox
                                                    checked={row.selected}
                                                    onChange={(event) =>
                                                        handleSelect(event, row.id)
                                                    }
                                                />
                                            ) : column.renderCell ? (
                                                column.renderCell({ value: row[column.field], row })
                                            ) : (
                                                row[column.field]
                                            )}
                                        </td>
                                    ))}
                                </tr>
                            ))}
                    </tbody>
                </table>
            </Box>
        </Box>
    );
};

export default StyledTable;
