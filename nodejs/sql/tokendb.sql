PGDMP                          v            tokendb    9.4.10    10.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �          0    16461 
   new_wallet 
   TABLE DATA               I   COPY new_wallet (id_new_wallet, address_wallet, private_key) FROM stdin;
    public       token    false    182   !
       �          0    16392 	   task_data 
   TABLE DATA               �   COPY task_data (id_task_data, from_csv, id_task, put_date, count_address, amount_token, active_task, number_times, real_number_times, remain_number, current_tx_hash, id_wallet) FROM stdin;
    public       token    false    176   �
       �          0    16399    task_history 
   TABLE DATA               e   COPY task_history (id_task_history, id_task, status, id_wordpress, start_date, end_date) FROM stdin;
    public       token    false    177   �       �          0    16408    transfer_history 
   TABLE DATA               s   COPY transfer_history (id, number_times, id_task, time_transfer, th_hash, sended_tokens, id_wordpress) FROM stdin;
    public       token    false    179   �       �          0    16421    wallet 
   TABLE DATA               O   COPY wallet (id_wallet, id_wordpress, address_wallet, private_key) FROM stdin;
    public       token    false    180   �%                  0    0    id_new_wallet_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('id_new_wallet_seq', 8, true);
            public       token    false    181                       0    0    id_task_data_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('id_task_data_seq', 44, true);
            public       token    false    173                       0    0    id_task_history_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('id_task_history_seq', 14, true);
            public       token    false    174                       0    0    id_wallets_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('id_wallets_seq', 6, true);
            public       token    false    175                       0    0    transfer_history_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('transfer_history_id_seq', 911, true);
            public       token    false    178            �   b   x���1 ���0xU�9M�����~|����>�"oc<�_��[W�^����f�L�H��IV�����1˨�e��^�����X      �   G  x��I�%9rEǑ��q���h$�m@�ۑF$�wf�y�BMM6�-�\��Y��/��{��������������zn1/]j�`��.�W���9�:b��O��W���\|QU��q�~��?�M�g��d�a�浏�ZB����V�*Wj�\I��V./˶W�g�"V\4�m��J}�.�\Qn�Jw/�|�9g��W�5��SW��J;lI���Ž~%��X����������b�ɂ��R�b���/�O�1�{�����j�i���A-��X\j���U�����v?�?V�y�Y��q��YsU尌k�ާ���h���3_��
1��RK����z��QZ#|�KlR?�XZ�î�̀Fػ�.�u6��U�t��b��G�V�mqd��)�Թ��"�U9�,��eߵ��������Z����h"}j�\d�K�y	���qqȋ���mO���1�=�w+�ZH�+6۲�������W+*�@�+�j���Z���D�ssI;�`�����L��ˀ�^(��S�bWYҘ}�N���JS��]��8Bi��-�[if��������Ʋ�l�,Ci���|+!�\r�)� � X�q��fj @�����ʹ��K(3m�a�ac��1U���0��r�&�4�О[n���K�����������2]�;�'.��S�$)ީ�jsg}䚣E�4-cy��C縔��|��Q��9�SacA���v�H�-��)�i�r*tv�p_���kf%\\��R$�48M[�{��N,�/a������0�K�ن��9��]�Z{���R����d���1����l-Z����iɽc8^t �垚)� �O�vΰ�i��ˢ�,^��6�EeE1/�m6QV��C�cε�,��X��yV)����b�����@�,�����I�+ǝ�tA=���W9x��Oطjp�.�}�2�)sY��v�ߞ K ����"2f�#�@������
uJ�)k�at�r��Q$�^�z�Ա5��n����sn�7X��\
) ��@"v����U�D�P"���+��J�>.l��	!4�Ȇ���䲬�-��r�A�����]������v`؂�ә���=8A��W.`���K����ɘy@_����Hi��8.M��*� Z*�+���'�w���������2}�O(C�aDCH�]�hș�>�Q�m��l��������[�۪�u��v
?imiu3�vE��;I�?K���/���c�{9D�dd��D,O�)N�2F����$��r�ۀ<����L9ί@��6	��P�ʅ�,\k~��|{�X��+NŖ��Rup57繯�@�Gk���)�[��;у�1�io �p��[��W���xևͶ2���`���[���6Z$uk~�~+jH��#ZZb���=2�W��y����1l/}N�Iҵ�U��A�W���
5�����b�qݖ:���ړ\j�D�rzPgk4L��څ�D�(���sR��&>Ч�=<$�"y��̘u�Ǿbt�FD��p����l�J����H��v `O֧X�F�$�)����f��F��C�.�RvOM ބl��C9E�@�ou�xVΣ��7q�/Z����~��\,R?��O��ɡ/$0{2��ѱeA�˭m�T\�/�2���:�L"g�q}� cS�������Q�N�Ԃ�0p��s��g;zZW���p�,m5v�
��i&��`�{�({�S|�]}���
�$cFvԾ�^�`��=B��W��������uVʆ�g�?hz�J�	�=ohm�y�j;0s0��pZs�����6�������~�|C�֢��-��E�I����g��0R���3X�\���mZ)�!��b�8S����Q��(##�9���z��<p��G֡�\��K�� R�Y$<jO@�#�_z�>�'�o���/�r@�N x�K'#� ʘ)��42a➖
&�ڥ�e���aBbI�W����e�ᛊ�֮�A�-]n6dgu(�C{�� -�9a��"�+���;��К��s?��7k%���M#e���%�Uw$���/�"��ۃ� �"�m�∠n,�@w��:B���Z���w}����#j3�c�T1�Dd��r�������)94�-�N�����`�&��������ɞd5�1l��y��O?`*��(k�f�7;�z"<��f���`���B�#	~Av0�X�4�^y	�M�~xM�c����s���k"5���:�^��D�u�V`!W��<��Q\��_4W�z!t��?���my���vތF�v��'@Ae��4h�k5�����2h�["�����`�"!�}��ZQiI�ֽ���H\pC���B�S�7��CǗ�o!���G� �1i��u�In$|�a�p�&G��𻖃���h�βD�ng��[|���	q �n5�Xj�>>�V�0��5	�ȗØ�Q�
�i���i�dh>�)���T�YC��χn\'>BFZcj��=��a���"��F
>�ʨ�t�L���i,XC������͢�V���r��R!��s���m��D_*y7B��!��6	��q���-��խ���иF���3�b��TFZ��2q�5�9@��͓x���a��Ӝ �)�5��X���<J��OB�.G�|�����R��Z9)�C�V��Y��IQ{��M�z�p6Orϵ�]�H����Y+���L�\�y�ֿ}9$�'�����/����F���$߉r�$3W�� �����].�3cYȟ�G�p�����������H�#�ҧ���$j!g�}b���<Ƶa���7����rQw˅N��%)dB\'�u'H��cb	��/�]�~_�� ��������d&�nlp��W��������B����¡���N�N?����gU�g$�?r�B���6���}�k6����!�T����CF��d��r9�	N�d����C��>�xzȁh�������Kk�K��y�-�N�����;�L��6:s�	G��-�	Z�ǭ "��`夆�Nh��5���[w��0�M6^Sia�k_��|N�w��F���崒h�N�R��L#��\J\�^n��`j�;�����%k����].tqy��ui�&�f�>πkh�|>����å�yy���*=@Z����c����R��ED���Y9�l�S͉�&R�����a7v�0��Y������C>�W@d 5k�0�u�E$l�|�K���=@��O�pX�g�u���r̒�NL �=�SD�d���w� 0���{�!��-�$�:�|Xz^�w��4 z �6�륗r�>����8m*����U�y�X�Lb0H�/z(�Hl6[�,���kMN��mR���f_�1!��Rk��~CDyq��A�q�<�8�gG�!]<�k�O͏���e�رD�X7���8����� 	�]>��j��{�@�|�z��ж7�X�	2.�E-m�/kt����Ǹ�qX�8��O�S6KI��&0\��$�Y\���sX�A@׏a���CV�?���_*��H�����un�|T�/߰hݯ�K�_Z�����b~�.ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.ޱ�w����G��`�O?F���t��č�Tp�_�.������ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.ޱ�w���x�.�Q�.8Y��?�R�1��O�R~�*��ز���]��3va�����o������      �   �   x�]�Mj�@��|��͌t���ϏK	���ǘ҄.����>J5�,Y��d�h{gi�:z�ם�����$%��,���ޖ��S��<M&���fE�k�[����vy#A�76��C����s(=������{*'l���\؇�yׄ�����O�˲<�S;�      �   "  x���K�)F��Z�:� {�	1��yR��>J/���K�/��%�"?ʏ_������_��?~�z����C��?d���C����Xm;�&����U_Y&���e=罘������'֔w�ʏ���:��^��s{����u�{rkx��-s�K��ӫ�u�O�vΞ�x����O�v��u9z�4�������"����5��<���s�ݨU��]ʪ1�����"��~V_��Ӆ�m��M�_k�Y�a6�̮j��H=Ǖ���S������l�𳞨��6����%����Q�VY��.���
l�J޶��"{Ѻo�7�++�v�o�z��K�Y����#���՞�M�t榱n|7�Zj룜�]�����u�����5�q��nR���=��uke eHi4�1�X__��缟U�{}3��7�Q��G{�YK@C�b!��ug�vMƦ�a���/^�`ߘ�:��I;�f��f����]�&^ZN��^۝+hC�m�͙X6����@��7h�Wn�E0C���U���c��%.�������G�:��9�l0~�e��Pk�����Z��%��և/o�1rw:��ʷ�,3Z{1����A��1���7�z;3>d�^5\�a�ʠ�L,���*���<*���zo\��'퐲�X �v���-�:h��V[�J�����.��%*G�y�#:D:ew��[���NU}u�8�qt^裺�%A�Jj(��}Ėi��� D=�v>�&y�_fR����wm��}����X~n�6F�[(��{���fMu���x�1�v�I$�*��pR�`���%���T�W�8�=����@��_Ar��3*w	-qO�_h��R��f���02�c��9RձA��q�Z�&a��u/m�Ue�rp_z��� 䫵.gBQ�t�^�\�7�)�����߰�tCV璽T���-@T�5��4�oA��o�Q��6�~����ɭug�6Pw�ee�*B��un�Z[4+�Z⥖���*
>�a��fUw`P�Zk��w�ڏ�ё�kC�]$�(����Q-k�W�ڱ�z��^j��<��;��~P"ŧG7�	
���֗q�&�u�ġ����yD����8���~��%���G g-�Ի>cg5QYMQ�)�������E0�[�`���<��@l��W�����_�w$�b����u}�prC.���,~�iWS9~~0YL%� ���KM@oS�����īl�N���V��Sg_y�#����w��tJ/
й�ƅA�܀SO�L�5٣�	��yG�8��΂L4�������֌6��w�i�u��)��W{�R�wZ��`V>�����o:o�M�KA+�*��8�e7<ȗ9�}M̨>�r+�F�fѥ�6�l��7`4��������@�����5g9��G�4��s��a��]�c��B�f����vw�a|#�na!'�'�Ҙ�a�|f�o���]��ADL��d��}{�f!2�ͦ�|��Q]@�z���	4<#�ك�38�J3�/bBN����P���'���&�}H�1�b	BiD4J�����3@W�a*�b�u(�β��My#o	��ȓx��/RT��w̎����=�Ik@-��Q�mܗ�,2D:�F-m!|;0��8�f�Q�lh9��k�!�)�X�0D��>2��1x��a��Z��}B��蜁(�D��Ț6�Ò�F�
��{,�J� �ĕ����1 ��� -��!��tl�rS��D�x��V2ς 24�:P�|%���Ȅ�Nb���%#?�J�W����d�	���s��eL�(�4����7D����@_�r�^e�Ϳ�����0 �[��:e��ȶ����w@��P.�ңQ#�+i� d��e'�
��<OY\� �=?�z�����]�,��L
\���/T�����\�Đ�i �҄E!�ĵ����S�E�x^����*c�,)�E*(�}��,�s�&�*��q�~~�IF)��� ��J�(қ)o;sqݲ���%4���S����U�ũ�v�O]�9�t����e�(>��J���Rؠp�3�Y(Yc!A�55������#K����P�f*�}����a�	v6��,hܜx[ZǾ��,5��}{�F����\�T�KJ\-�tf(���B%�!�b�("��o�~7�`�R�l;9�|Dt��Ag�C��`<� i]	���1�㽉0�>�{-v���	���(���\Ô��{k=X��%H�]y��S�wb�fS��%
��3}!�lU�/*i �&2�}�άsa��!g��ɖd˜xo���0bA���`[>������S�Y ���V��'���A����cU�#;p�!�5�)��$Ҵ|���%
�Ou1�����B�����S�h%S7��H-�`'/a���6���Kn=��7-4t��Hj��fD��6YgH�|�B�s?��5ol%�=�?�9R!D�D��X [����ǘ2+fLsY�k�ny��Y�#hh�K�=zs2$|d�%�'�n�(���s+����YV������.N�V��yqI�l��l���6�P���� �Od-�i���
`�`�l�$Y3<���8[�h�}Q)�kTA g����|+����yt�}�jAL�`�&�(ʱ(!Q��E��[%4���h=,��`��k�U��wcCl����C�d�K)*�֟is�qDF)Ԯq�`M�>y�s��Fj�N�Jl�6�	��z���Y��X�	��썠h�����HgY�XdaW��{#��L�mG�b�/���&�}���Ց䗻����
�cˮ1e"�w$����_���E��'���:xf�I�vK)�Ͽ�����ep      �   c   x���1 ���0xU�9M���ݕ�.��M�7~nӣ�(��	��0m�#l}\�ziF��g.��3#+K$Y���S|�3K�,�>��r{=Zk��     