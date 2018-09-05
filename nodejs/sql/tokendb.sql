PGDMP          .                v            tokendb    9.4.10    10.0 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16385    tokendb    DATABASE     e   CREATE DATABASE tokendb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE tokendb;
             token    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7                        0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    11855    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16459    id_new_wallet_seq    SEQUENCE     s   CREATE SEQUENCE id_new_wallet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.id_new_wallet_seq;
       public       token    false    7            �            1259    16386    id_task_data_seq    SEQUENCE     r   CREATE SEQUENCE id_task_data_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_task_data_seq;
       public       token    false    7            �            1259    16388    id_task_history_seq    SEQUENCE     u   CREATE SEQUENCE id_task_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.id_task_history_seq;
       public       token    false    7            �            1259    16390    id_wallets_seq    SEQUENCE     p   CREATE SEQUENCE id_wallets_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.id_wallets_seq;
       public       token    false    7            �            1259    16461 
   new_wallet    TABLE     �   CREATE TABLE new_wallet (
    id_new_wallet integer DEFAULT nextval('id_new_wallet_seq'::regclass) NOT NULL,
    address_wallet character varying(42),
    private_key character varying(64)
);
    DROP TABLE public.new_wallet;
       public         token    false    181    7                       0    0 
   new_wallet    ACL        REVOKE ALL ON TABLE new_wallet FROM PUBLIC;
REVOKE ALL ON TABLE new_wallet FROM token;
GRANT ALL ON TABLE new_wallet TO token;
            public       token    false    182            �            1259    16392 	   task_data    TABLE     �  CREATE TABLE task_data (
    id_task_data integer DEFAULT nextval('id_task_data_seq'::regclass) NOT NULL,
    from_csv text,
    id_task character varying,
    put_date date,
    count_address integer,
    amount_token numeric,
    active_task boolean,
    number_times numeric,
    real_number_times numeric,
    remain_number numeric,
    current_tx_hash character varying,
    id_wordpress integer
);
    DROP TABLE public.task_data;
       public         token    false    173    7            �            1259    16399    task_history    TABLE     �   CREATE TABLE task_history (
    id_task_history integer DEFAULT nextval('id_task_history_seq'::regclass) NOT NULL,
    id_task character varying,
    status character varying,
    id_wordpress integer,
    start_date date,
    end_date date
);
     DROP TABLE public.task_history;
       public         token    false    174    7            �            1259    16406    transfer_history_id_seq    SEQUENCE     y   CREATE SEQUENCE transfer_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.transfer_history_id_seq;
       public       token    false    7            �            1259    16408    transfer_history    TABLE       CREATE TABLE transfer_history (
    id integer DEFAULT nextval('transfer_history_id_seq'::regclass) NOT NULL,
    number_times numeric,
    id_task character varying,
    time_transfer date,
    th_hash character varying,
    sended_tokens text,
    id_wordpress integer
);
 $   DROP TABLE public.transfer_history;
       public         token    false    178    7            �            1259    16421    wallet    TABLE     �   CREATE TABLE wallet (
    id_wallet integer DEFAULT nextval('id_wallets_seq'::regclass) NOT NULL,
    id_wordpress integer,
    address_wallet character varying(42),
    private_key character varying(64)
);
    DROP TABLE public.wallet;
       public         token    false    175    7            �          0    16461 
   new_wallet 
   TABLE DATA                     public       token    false    182   �!       �          0    16392 	   task_data 
   TABLE DATA                     public       token    false    176   �"       �          0    16399    task_history 
   TABLE DATA                     public       token    false    177   �1       �          0    16408    transfer_history 
   TABLE DATA                     public       token    false    179   32       �          0    16421    wallet 
   TABLE DATA                     public       token    false    180   >                  0    0    id_new_wallet_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('id_new_wallet_seq', 8, true);
            public       token    false    181                       0    0    id_task_data_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('id_task_data_seq', 95, true);
            public       token    false    173                       0    0    id_task_history_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('id_task_history_seq', 22, true);
            public       token    false    174                       0    0    id_wallets_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('id_wallets_seq', 6, true);
            public       token    false    175                       0    0    transfer_history_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('transfer_history_id_seq', 914, true);
            public       token    false    178            {           2606    16427    task_data task_data_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY task_data
    ADD CONSTRAINT task_data_pkey PRIMARY KEY (id_task_data);
 B   ALTER TABLE ONLY public.task_data DROP CONSTRAINT task_data_pkey;
       public         token    false    176            }           2606    16429    task_history task_history_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY task_history
    ADD CONSTRAINT task_history_pkey PRIMARY KEY (id_task_history);
 H   ALTER TABLE ONLY public.task_history DROP CONSTRAINT task_history_pkey;
       public         token    false    177            �           2606    16431 &   transfer_history transfer_history_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY transfer_history
    ADD CONSTRAINT transfer_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.transfer_history DROP CONSTRAINT transfer_history_pkey;
       public         token    false    179            �           2606    16449    wallet wallets_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY wallet
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id_wallet);
 =   ALTER TABLE ONLY public.wallet DROP CONSTRAINT wallets_pkey;
       public         token    false    180            ~           1259    16434    id    INDEX     =   CREATE UNIQUE INDEX id ON transfer_history USING btree (id);
    DROP INDEX public.id;
       public         token    false    179            �   �   x�Eʽ
�0 �O��:$��^pJ�R�V��	������:���7�zZb�Kq������EqH㟥�)]�v��r=<��#�'b�k�E������UR�h�11�1[--(��T+�lU��Mm���JbpD�l5�'T��1�B��ԸZ; �}����j�|2˲�z*6�      �   �  x���I�&���������A2$�'|0 Ȁ����`�d�"0��ö0�T&0�k}�U|�]����O���_~�����~�ۻQ?՗_}7���g�/�Ï����?��������?�_��/���?|zW��0?~|}��|��ǿ�����������}��}����f���/_z_�������Ç�k���_�ǿ~���������I�~���~�����W%��|�_�z��������9�TC�~�+�;�ͭ�_�#yKn��7?��?O��x+v�X�o����je��|p3V+����~{?�w3���)�cR��KS���j�K�&�ť�9�����\ι �B���6��hO3�����
��[��J٬��YX�����D�[Ρ���:K��ܻ�r����!Dw/�CU��b�)Y=�֩%������\Οʱ������G��=�J���W7�]Gb��{����y��;���l%�3��B�՛�{��<��{��ww*٤?�C�8+�.~��VMMzml0�ދ$i^�]�9s��ךY���hW��ӏ�g_<-H��N�z���߁��5�4笻�mM�_��Oٵ�΅D�}E�`�4y��P���Z,�ջ���U������:��m����X�Y��� �<��J���R�p���D�R5�+4������zƂ&�p/�l���z����$���tE��va��8R�����/˵�z�*5q�+ֶZ,!�z [���\.XJ�B2I9���\�% z�s�
 |�s��[�#���1��Cb�iv��טbf1����/��� f����Xf~��U&����{�5x�.�xǥ�N�D��N��CP�3k=�4����T�������r!�#z} �Z�;6�d��St�T[,/Cz)����޵�X	�8��)P����ճ\V'��g�'׼�u�JҮ�uJb}�<皳X��G���X�}X.��*NѢ��O���\+d�c�w�\�i�Bw��0�n��[�
��L*�l�ˬ�\(xVt�Z�o��g��7h��1WY��34Oŭ���4$�:d9���wm��!��V��o��@�O����o��>��Z��*ytS�Ԑ���Ξ K ����"�G-=�@�ˢca�2����%כ�K9�zx$�^N[�ذ%�o��q��6
�òUX�\.��r�@"�V��OE8D�P���
�s\�/l��B��?aHyjnK��i�I�V�y���Ck����c؂�����=� N�
�fA��襜s�0}2f���j1��cqN��c��
�ɀ��<s�gyzD���|�u+�&x1���pA�"��D�K��>�Q��:�q�
�`_�m����-����y��H;����:}1U�v�pw9��rQ�]����B�{9D�fdd���,O\1o�%�ǭ��I�9�G��ytk��+��_�61m��F��ʹ�,�Kz��lYX��
NE�n�跥j�j,����@��K	��y(���l7 �7����ǵ ���򯰭S��>,�����Cǃ`���jn�l)#�VیWΊ�b29�燑5ye���0je��q�rCa�x-��P����J�f��bd1ܸn��LRCiQ.�LF9>��V� �����K"�s��Ơ,j��&�1��sxH�E~x��̨6~�6C�L��l��R�?܃�,�J�K��H��8v� `�چh�Z{�$�)����F�{��A�L�R6�U ވ���C9�@;�r��-l�̔zţ/���,!t�=%|�\.d)���εM>ɵ�&�ʜU&6O���E�
s٥\"c<�^#�I��	�W	!T5�01J�Ȃ�ZN����Y���d�/n����]�B<:�#�v��~ea�M��-�^��$�CO��g�� 3|ϟ�-����E�@L���y�£��^E9���+Ztl����3�Z��5�_�n��8o�ϼ���+j7'3�n9��,�N2u���?�Z��H�<x���`�c�:Kӡ97�� �d�Ʊ�۵c�j<E�p�1�����k���&8�}�r]]$;�r��$��aP{B�3��R��=a}��vɐ�"���h��w���BZ�@ �&�iz�k���d�x�.$��xEl �i��)�����d]2V��>����b@���0�,����رp-����{�R[D�Q��7����e�Z�~B~�R. �;�=�-�^�LZuc�� r8�H��e��r䐄�����Qa���#젊Q'� �����?b��d�8���4%����0�k%*Zq-ǐ=ɪ�m�H��N�G�󀩨_�(s�f�;;�9f�=�����`�V�D�	~Av0�X��}��N��p���r8i��@�g��@j2��v��#���aZ�-@�8�K�j���*���:�d���B)����&��Az�Z��Qw���� (���.vF�Z�m�<��
�tF�p#���ͥ�0.D�`_x�TZ"�u�.r9\ѭΡD`�謆E�4��%�,������CR���y�	�p�
\�H��9<�2�������x�����+�D ߲�a,B 9íD�A��\����f�xM�<�e0�Z�u:�4\z��	��w
�a_!e�ZQ?�����	!#͆1�3t7�,�?���������41�}�{%� V�~>�\�]�Y�*Vf\v⚠[
��p�ki��Z.W���w4��[����87r���12 NX�lK�M��GH�Έ/�����]I�h"N武#9(T�<�wp���p��f(L�*.�ʚ<����fm'�s9�Zz��"J�+K�S؇�!��X�#w�͢G��v3�|Л'����ʮGΠ��(O�Y&l�i��ξ��z���Y�幑���&���;P�Ňđ �p�{�y��`�3�L�Xf�ǅ#~8M���;��җq�X��w��m��%����1r	b�/�j�MN�7Ŀ ���r�S{Gd�HDr�׈w��k�XB�K9�Eg~�W�q����d��`�B�������H��m��}u#���b����#'�]�1��a��r�����Gn#^x�:�͹5�q侅U%)Y���^�ai��"���Op������V�?k�Aկ�E͉4r Z%�b����Ҿ�;z����6.��h�����I�%�a��%<Am�f@dz}
�wjx����Oj�W���&F���kzFX�\�b&�N��Nq�\Q�g����	Y^`��C�8�R.F�z/��l0���l�y�ǰ��5��C:��� �M��a]\�J���O��*,��{��G5w)�oޝ�t����մ�lCZ]t����x.�y���CL�'�H%>�Y{C��c� 7z��/���2\�����1��Q�D�j��V�̩�r���~���i�U����,�Ј	`a��s)Q�(�x�������ܾٲB�+C���}3wޡ�=�聐�ط������ɡ�m*��_��Q�qy�I&Q$��=�G6���.u�L�����8M�ъ3�b(�	q�p1k]��"J�&
U���}ǟP�x��%=��ܦbǪ�a�D������� 	�]�p4J��Ǯ;Ku_��n� Ä�Q�\'��6��ߛ����]��
�Ǳ�?�y�l��ؽE`���?$0Y����uǌ�M�[T/��E���};z�����}^\~+��Ϡ�ח}L����a]���W���/�~�q�ח�߼�ۿ|����o�������      �   �   x�M�A�0��Sa���M:u� �Bή2�?$Aƶ��}*�=~ｪ�ʋ��Q-���m�avH&;���A����=;�t���.V$������/;H8'��l��4��1�Ι��H�,;�8�x٩�\��Z���,����]��uz���ll7,      �   �  x�͘K������g�l��43t�E��B�tF3lB�b�4�������ϢM|�c����~7������������~�����׻�����퇏�����oϫ�w�����o��^ޞ?�?�z�������͏oև7�^>���\��O���������{���˗������務꫗�����d�&�z��^WW{�T�볇{J�do�s]�4^�|-���תc�;n����Z�lw�K���묳�n˖���0=�~n6�7��O�u��[��t���g�������NOG\�+�U�i�U�^�7S;뎙�Ijm1S�u.=�z�sZ���0�������j�r+5�b\�W�w�ݶ�}����`J�RN��,�Su�>��\k�i�+�pQ�\�ͪE�t��r%��EF޹���m���XN)].yYY<�Fp���J^��]׮i�v
����e#�棦��Z�=M��]�9��(��k)��d/f{�0���>�񾭇�ıƨ]��3�4N�h�M�<͏���ϱ�g����a�O�T��Pիܬ�>�ҹ�I��+��k�K�:<~��Om��?�Z�V/s��-t���ӭ9?)c��`�=%��R����-k�Y��eMK�Rk�����\3��=Z��t�\?�n�L�Ԟv�fY{�V��,Sv��T�%s�]�̭��jT�:z�$s@9\S˖��;�l�݁K?i�k����jY�j k2�Cl����b�=�Ԓ�s�h��t3�k�RYn�k��JC�����x*��*�/�z��y3S/k,��zg`�qܛe��O�����`xM%�iw՜�ı�����u���|���2��%X���u�'�0Vf�b����յ�m�8��x]w��^�k�
l���Yh �R�Â�n�/`�;EK_��ҕΦ����⩆0�fw�<�4E�m�M�˾sq������:��^��7Z.>d cy5��jK����-uf][]�:�g4��Y���}��7�|��Ͼ��<
/�C��Y��v���a*�H�!��AQE�S��2U���|��P�t� j"}?����v��n^أ璼-���f��ï�}��#$�k��e_�Y�ԡ��~���"�P���Q*�wΙuwǫ�J�d����MWZ<U|�^�A�Pi	ތ�
��I�Xml�
#��Z���#w�a(x�4�����7�l4&m�ߍ	ݭ�bW&�D����T/m��!�]��V���7љ=����F���J���KC�����ey��_\t�S���:�E$㠻u�a�^��c�tXq,��J�w^N�R���?ޅ��vN�<�]�Ԋ�wFJ�ho�!��V�~�`c&�@�2+��#��+���$P��6<��5dS���h�N��b`��`���>n���ƞ��G��&Np��4�b7r����&�H�aw���"jJ��x)���׌�FX?h�(sW�ݵ4b�RE6(�kD�\��LO�o�-�X��C�[�����>7p$]-�~z�E�xn^y,�e:s�ǒע.�.�,��'
 ls)���V։�z�:�8�qܐ-z��a�e�s��x���}k\M[8֌(X:F��@5��|�s�c��x��� #u p/�K�#c��ם R����tˢՆZ�{�{[�߸t	�Bh2����;�	v�~��ɍ���=��M�?�{A��`!Ճ�D���vr[B(�]bf0%",��	��)�n��:.
���K�?;���L��(�ZцKgBhdC���4�)
eP�4�x��D������s��~@�qC��G����a38������q.�$)�E���,�Fur���R�P����٭�"3��!M+	�[��3��,�ħ,�XB�JE�$�l�`<}!���ഷ2Z�k�1�T.>��HFJB6�SkN0A}�$�y���B�5HU� �5(XP�v�7���Qa:SuN[�8*Н#!���������~E�)�%����&JV��d��L�ߜ����.�^��p�q�D�F�n#`a���^")v��
[i,+^��hz%�ﺮ��I�5����`$�#�,)3�O���.ǃGE,�5J�A�
��ե����h,/䂻;*�c1�X `�`>��!vZ{���	j��$�a� ���f���i-d�.�
�Y���P\ֿD��z� �;,�.vԳ�-����ż��,�!"9ZzB�n��R/7I� ��j���Z�!-����b��p$_��T"�H��ȣ����2^_H�0�bC46��O����E��[��G�]YW	�o=K`�0,�,��D�g ���4�22N����W�`l�l�aG���E1
׈�� �l�숂@^���
� ���~�&Y���&-���=�9��G�^���_�	�ά�8=������H�@u��hl�/+����$�H��X���,~�2O>N�VO$�Ŗjy˨��ڞiI-�d�f�#8`��C�A�b �?��1z�uūm'B��u�Ĝ粿3�OQ�("o���-���;��#X�q�"��o(��`a�s%�0XV�o��	�QnZ�������_�����@%��%]x�H��R�Dё������Γ�HG�(��S�@oْ��,��:$[�@8���xm	�eKd"�� �r�����a�~����W0���ߋ��C���� Lnt�McR��z*?��=���jƴ(A���l Ԡ#���MF�ǻ6��ز^8�ovga!�����j�E���9�������Ř��ƺ}���g;�LL�$�K�̃͒X?6yj-s�����?
8��D�ʲ�BLgb��6�G\�usH�K�斔����R���i�>	!�y��H#�8�+2*i!�(r0��[���MkԐ����J�cg�4+��s���� *{�$��Z�UK^������*���� 4v�zCb��ġ�P��|��0��	��d��uyG=,����*N�l�`�(���TeB!C��m*�~�ۨ�-���>��AĜ�
w��/�����:      �   �   x�=ʽ
�0@�Oq���!��i�S�ހ 
���h"J�^Ep���Ū�M�U����x�l��|y��e��k>�/��2w��)�rؙ�Z�d���=�V~�ZE�B)��i��C�Y���*��ԔN���3�Q�jG5nIqGNJBe\e�L�JDim��(�F�i>O���N9f     