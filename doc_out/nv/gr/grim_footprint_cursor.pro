;=============================================================================
; grim_footprint_cursor
;
;=============================================================================
pro grim_footprint_cursor, swap=swap



 mask = byte_to_bit([ [[0,0,0,0,0,0,1,1] ,[1,0,0,0,0,0,0,0]], $
                      [[0,0,0,0,0,0,1,1] ,[1,0,0,0,0,0,0,0]], $
                      [[0,0,1,1,1,1,1,1] ,[1,1,1,1,1,0,0,0]], $
                      [[0,0,1,1,1,1,1,1] ,[1,1,1,1,1,0,0,0]], $
                      [[0,0,1,1,1,1,1,1] ,[1,1,1,1,1,0,0,0]], $
                      [[0,0,1,1,1,0,1,1] ,[1,0,1,1,1,0,0,0]], $
                      [[1,1,1,1,1,1,0,1] ,[0,1,1,1,1,1,1,0]], $
                      [[1,1,1,1,1,1,1,0] ,[1,1,1,1,1,1,1,0]], $
                      [[1,1,1,1,1,1,0,1] ,[0,1,1,1,1,1,1,0]], $
                      [[0,0,1,1,1,0,1,1] ,[1,0,1,1,1,0,0,0]], $
                      [[0,0,1,1,1,1,1,1] ,[1,0,1,1,1,0,0,0]], $
                      [[0,0,1,1,1,1,1,1] ,[1,0,1,1,1,0,0,0]], $
                      [[0,0,1,1,1,1,1,1] ,[1,1,1,1,1,0,0,0]], $
                      [[0,0,0,0,0,0,1,1] ,[1,0,0,0,0,0,0,0]], $
                      [[0,0,0,0,0,0,1,1] ,[1,0,0,0,0,0,0,0]], $
                      [[0,0,0,0,0,0,0,0] ,[0,0,0,0,0,0,0,0]] ] $
                    )

 bitmap = byte_to_bit([ [[0,0,0,0,0,0,1,0] ,[1,0,0,0,0,0,0,0]], $
                        [[0,0,0,0,0,0,1,0] ,[1,0,0,0,0,0,0,0]], $
                        [[0,0,1,1,1,1,1,0] ,[1,1,1,1,1,0,0,0]], $
                        [[0,0,1,0,0,0,1,0] ,[1,0,0,0,1,0,0,0]], $
                        [[0,0,1,0,1,1,1,0] ,[1,1,1,0,1,0,0,0]], $
                        [[0,0,1,0,1,0,1,0] ,[1,0,1,0,1,0,0,0]], $
                        [[1,1,1,1,1,1,0,1] ,[0,1,1,1,1,1,1,0]], $
                        [[0,0,0,0,0,0,1,0] ,[1,0,0,0,0,0,0,0]], $
                        [[1,1,1,1,1,1,0,1] ,[0,1,1,1,1,1,1,0]], $
                        [[0,0,1,0,1,0,1,0] ,[1,0,1,0,1,0,0,0]], $
                        [[0,0,1,0,1,1,1,0] ,[1,1,1,0,1,0,0,0]], $
                        [[0,0,1,0,0,0,1,0] ,[1,0,0,0,1,0,0,0]], $
                        [[0,0,1,1,1,1,1,0] ,[1,1,1,1,1,0,0,0]], $
                        [[0,0,0,0,0,0,1,0] ,[1,0,0,0,0,0,0,0]], $
                        [[0,0,0,0,0,0,1,0] ,[1,0,0,0,0,0,0,0]], $
                        [[0,0,0,0,0,0,0,0] ,[0,0,0,0,0,0,0,0]] ] $
                    )

 device, cursor_mask=swap_endian(mask), cursor_image=swap_endian(bitmap), $
                                                            cursor_xy = [2,13]




end
;=============================================================================
